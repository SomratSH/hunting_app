import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hunting_app/application/hunts/model/hunts_model.dart';
import 'package:hunting_app/application/hunts/repo/hunts_repo.dart';
import 'package:image_picker/image_picker.dart';

class HomeProvider extends ChangeNotifier {
  HuntsModel huntsList = HuntsModel();
  HuntsModel filteredHuntsList = HuntsModel(); // Store filtered results
  bool isLoading = false;

  final TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  // Function to get all hunts
  Future<void> getHunts() async {
    isLoading = true;
    notifyListeners();
    final response = await HuntsRepo().getHunts();
    huntsList = HuntsModel.fromJson(response);
    filteredHuntsList = huntsList; // Initially, show all hunts
    isLoading = false;
    notifyListeners();
  }

  // Function to search hunts based on query
  void searchHunts(String query) {
    searchQuery = query;
    if (searchQuery.isEmpty) {
      // If the search query is empty, show all hunts
      filteredHuntsList = huntsList;
    } else {
      // Filter the hunts list based on title, description, or other fields
      filteredHuntsList = HuntsModel(
        results: huntsList.results!
            .where(
              (hunt) =>
                  hunt.title!.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ) ||
                  hunt.city!.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList(),
      );
    }
    notifyListeners(); // Notify listeners to update the UI
  }

  List<Clues> cluesList = [];
  Future<void> readCluesApi(String id) async {
    final response = await HuntsRepo().readClue(id);
    if (response.isNotEmpty) {
      List<dynamic> data = response;
      cluesList.clear();
      for (var e in data) {
        cluesList.add(Clues.fromJson(e));
      }
      notifyListeners();
    }
  }

  //unlock clues

  Future<String> unlockClue(String qrCode) async {
    final response = await HuntsRepo().unlockClue({"code": qrCode});
    if (response["message"] != null) {
      return response["message"];
    } else {
      return "";
    }
  }

  //udate rating

  String rating = "0";

  updateRating(String value) {
    rating = value;
    notifyListeners();
  }

  //submit rating

  bool isRatingLoading = false;


  Future<Map<String, dynamic>> submitRatingApi(String id) async {
    isRatingLoading = true;
    notifyListeners();
    final response = await HuntsRepo().submitRating({
      "score": rating,
      "review": "",
    }, id);

    if(response.isNotEmpty){
      isRatingLoading = false;
      notifyListeners();
      return response;
    }else{
      isRatingLoading = false;
      notifyListeners();
      return response;
    }
  }

  Results? selectedForDeatils;
  void updateHunts(Results hunt) {
    selectedForDeatils = Results();
    selectedForDeatils = hunt;
    notifyListeners();
  }


  File? imageFile; // For the selected image file
  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
    
        imageFile = File(pickedFile.path);
        notifyListeners();
    
    }
  }


  //calmed price
  Future<Map<String, dynamic>> clamPriceApi(String code)async{
    isLoading = true ;
    notifyListeners();
    final response = await HuntsRepo().calmPrice({
      "voucher_code" : code
    }, imageFile!);
    if(response.isNotEmpty){
          isLoading = false ;
    notifyListeners();
      return response;
    }else{
          isLoading = false ;
    notifyListeners();
      return response;
    }
  } 

}
