import 'package:flutter/material.dart';
import 'package:hunting_app/application/hunts/model/hunts_model.dart';
import 'package:hunting_app/application/hunts/repo/hunts_repo.dart';

class HomeProvider extends ChangeNotifier{
  List<HuntsModel> huntsList = [];  
  bool isLoading = false;


  Future<void> getHunts()async{
      isLoading = true;
      notifyListeners();
      final response = await HuntsRepo().getHunts();
      huntsList = response.map((e) => HuntsModel.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
  }

}