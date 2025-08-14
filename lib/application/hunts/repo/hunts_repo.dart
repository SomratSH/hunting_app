import 'dart:io';

import 'package:hunting_app/api_serivce/api_service.dart';
import 'package:hunting_app/application/hunts/model/hunts_model.dart';
import 'package:hunting_app/constant/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HuntsRepo {
  Future<Map<String, dynamic>> getHunts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await ApiService().getData(
      authToken: prefs.getString('authToken'),
      AppUrls.huntUrl,
    );
    return response;
  }

  Future<List<dynamic>> readClue(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await ApiService().getList(
      "${AppUrls.clueRead}?hunt_id=$id",
      authToken: prefs.getString('authToken'),
    );
    return response;
  }

  Future<Map<String, dynamic>> unlockClue(Map<String, dynamic> data)async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final response = await ApiService().postData(AppUrls.unlockClue, data, authToken: prefs.getString('authToken'));
        return response;

  }   

  Future<Map<String, dynamic>> submitRating(Map<String, dynamic> data, String id)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final response = await ApiService().postDataRegular("${AppUrls.submitRating}$id/create/", data, authToken: preferences.getString('authToken') );
    return response;

  }


    Future<Map<String, dynamic>> calmPrice(Map<String, dynamic> data, File image)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final response = await ApiService().postData(AppUrls.clamPrice, data, authToken: preferences.getString('authToken') , image: image, imageParamNam: "claimed_photo");
    return response;

  }


}
