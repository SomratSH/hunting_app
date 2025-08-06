import 'package:flutter/material.dart';
import 'package:hunting_app/api_serivce/api_service.dart';
import 'package:hunting_app/application/authentication/authentication_repo/authentication_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;
    final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();



  bool isAgree = false;

  updateOtp(String value) {
    otpController.text = value;
    notifyListeners();
  }

  Future<String> signUpUser() async {
    isLoading = true;
    notifyListeners();
    final response = await AuthenticationRepo(ApiService()).signUp({
      "name": nameController.text,
      "email": emailController.text,
      "phone": 
      phoneController.text,
      "role": "USER",
      "password": passwordController.text,
    });
    isLoading = false;
    notifyListeners();
    return response["message"];
  }

  Future<String> signUpVerifyUser(String email) async {
    isLoading = true;
    notifyListeners();
    final response = await AuthenticationRepo(ApiService()).signUpVerify({
      "email": email,
      "otp": otpController.text,
    });
    isLoading = false;
    notifyListeners();
    return response["message"];
  }

  Future<Map<String, dynamic>> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();
    final response = await AuthenticationRepo(ApiService()).login({
      "email": emailController.text,
      "password": passwordController.text,
    });
    if(response["message"] == "Logged in successfully.") {
      prefs.setString('authToken', response["access_token"]);
      prefs.setString('refreshToken', response["refresh_token"].toString());
      notifyListeners();
    } else {
      debugPrint("Login failed: ${response["message"]}");
    }
    isLoading = false;
    notifyListeners();
    return response;
  }


  //forgot password
  Future<Map<String, dynamic>> sendOtp() async {
    isLoading = true;
    notifyListeners();
    final response = await AuthenticationRepo(ApiService()).sendOtp({
      "email": emailController.text,
    });
    isLoading = false;
    notifyListeners();
    return response;
  }
  Future<Map<String, dynamic>> verifyOtp(String email) async {
    isLoading = true;
    notifyListeners();
    final response = await AuthenticationRepo(ApiService()).verifyOtp({
      "email": emailController.text,
      "otp": otpController.text,
    });
    isLoading = false;
    notifyListeners();
    return response;
  }   
  Future<Map<String, dynamic>> resetPassword() async {
    isLoading = true;
    notifyListeners();
    final response = await AuthenticationRepo(ApiService()).resetPassword({
      "email": emailController.text,
      "password": passwordController.text,
      
    });
    isLoading = false;
    notifyListeners();
    return response;
  }

}
