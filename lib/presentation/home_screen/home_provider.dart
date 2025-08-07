import 'package:flutter/material.dart';
import 'package:hunting_app/application/hunts/model/hunts_model.dart';
import 'package:hunting_app/application/hunts/repo/hunts_repo.dart';

class HomeProvider extends ChangeNotifier{
  HuntModel huntsList = HuntModel();  
  bool isLoading = false;


  Future<void> getHunts()async{
      isLoading = true;
      notifyListeners();
      final response = await HuntsRepo().getHunts();
      huntsList = HuntModel.fromJson(response);
      isLoading = false;
      notifyListeners();
  }

}