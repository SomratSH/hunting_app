import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hunting_app/application/profile/model/profile_model.dart';
import 'package:hunting_app/application/profile/repo/profile_repo.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider();

  ProfileModel profileModel = ProfileModel();

  bool isLoading = false;
  void getProfile() async {
    isLoading = true;
    notifyListeners();
    final response = await ProfileRepo().fetchProfile();
    if (response.isNotEmpty) {
      profileModel = ProfileModel.fromJson(response);
      isLoading = false;
      notifyListeners();
    } else {
      debugPrint("No profile data found");
    }
  }

  Future<Map<String, dynamic>> updateProfile(
   {
    String? name,
    String? phone,
    File? image,
   }
  ) async {
    final response = await ProfileRepo().updateProfile({"name": name}, image);
    if(response.isNotEmpty) {
      profileModel.data?.name = name;
      profileModel.data?.phone = phone;
      notifyListeners();
    } else {
      debugPrint("Failed to update profile");
    }
    return response;
  }
}
