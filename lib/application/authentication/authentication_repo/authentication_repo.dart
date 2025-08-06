import 'package:flutter/widgets.dart';
import 'package:hunting_app/api_serivce/api_service.dart';
import 'package:hunting_app/constant/app_urls.dart';

class AuthenticationRepo {
  final ApiService _apiService;

  AuthenticationRepo(this._apiService);


  Future<Map<String,dynamic>> signUp(Map<String,dynamic> body) async {
    final response = await _apiService.postDataRegular(AppUrls.signUp, body);
    debugPrint("Response from signUp: $response");
    return response;
  }
  Future<Map<String,dynamic>> signUpVerify(Map<String,dynamic> body) async {
    final response = await _apiService.postDataRegular(AppUrls.signUpStep2, body);
    debugPrint("Response from signUpVerify: $response");
    return response;
  }

  Future<Map<String,dynamic>> login(Map<String, String> map) async {
    final response = await _apiService.postDataRegular(AppUrls.loginUrl, map);
    debugPrint("Response from login: $response");
    return response;
  }

  //forgot password
  Future<Map<String, dynamic>> sendOtp(Map<String, String> body) async {
    final response = await _apiService.postDataRegular(AppUrls.sendOtp, body);
    debugPrint("Response from sendOtp: $response");
    return response;
  }
  Future<Map<String, dynamic>> verifyOtp(Map<String, String> body) async {
    final response = await _apiService.postDataRegular(AppUrls.verifyOtp, body);
    debugPrint("Response from verifyOtp: $response");
    return response;
  }
  Future<Map<String, dynamic>> resetPassword(Map<String, String> body) async {
    final response = await _apiService.postDataRegular(AppUrls.resetPassword, body);
    debugPrint("Response from resetPassword: $response");
    return response;
  }
}