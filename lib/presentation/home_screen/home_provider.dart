import 'package:flutter/material.dart';
import 'package:hunting_app/application/hunts/model/hunts_model.dart';
import 'package:hunting_app/application/hunts/repo/hunts_repo.dart';

class HomeProvider extends ChangeNotifier {
  HuntsModel huntsList = HuntsModel();  
  HuntsModel filteredHuntsList = HuntsModel();  // Store filtered results
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
            .where((hunt) => hunt.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
                             hunt.city!.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList(),
      );
    }
    notifyListeners(); // Notify listeners to update the UI
  }


  Future<void> readCluesApi(String id)async{
    final response = await HuntsRepo().readClue(id);
  }
}
