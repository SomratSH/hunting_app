import 'package:flutter/material.dart';
import 'package:hunting_app/application/hunts/model/hunts_model.dart';
import 'package:hunting_app/application/hunts/repo/hunts_repo.dart';

class HomeProvider extends ChangeNotifier{
  HuntsModel huntsList = HuntsModel();  
  bool isLoading = false;


  Future<void> getHunts()async{
      isLoading = true;
      notifyListeners();
      final response = await HuntsRepo().getHunts();
      huntsList = HuntsModel.fromJson(response);
      isLoading = false;
      notifyListeners();
  }

}