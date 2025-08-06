import 'dart:io';

import 'package:hunting_app/api_serivce/api_service.dart';
import 'package:hunting_app/constant/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  ProfileRepo();

  // Add methods to interact with the profile data
  Future<Map<String, dynamic>> fetchProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await ApiService().getData(
      AppUrls.profileUrl,
      authToken: prefs.getString('authToken'),
    );
    return response;
  }

  Future<Map<String, dynamic>> updateProfile(
    Map<String, dynamic> profileData,
    File? image,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await ApiService().patchData(
      AppUrls.updateProfile,
      profileData,
      image: image,
      authToken: prefs.getString('authToken'),
    );
    return response;
  }
}
