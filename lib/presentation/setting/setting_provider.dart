import 'package:flutter/material.dart';
import 'package:hunting_app/application/setting/model/plan_model.dart';
import 'package:hunting_app/application/setting/repo/setting_repo.dart';

class SettingProvider extends ChangeNotifier {
  List<PlanModel> planList = [];

  bool isLoading = false;

  Future<void> getPlanList() async {
    isLoading = true;
    notifyListeners();

    final response = await SettingRepo().getPlan();
    planList = response.map((e) => PlanModel.fromJson(e)).toList();

    isLoading = false;
    notifyListeners();
  }

  Future<String> createSubscriptionApi(String priceId) async {
    isLoading = true;
    notifyListeners();
    final data = await SettingRepo().createSubscription( {}, priceId, );
    if (data.isNotEmpty) {
      isLoading = false;
      notifyListeners();
      return data["checkout_url"];
    }
    return "";
  }
  
  String terms = "N/A";
  String policy = "N/A";

  Future<void> getTermsApi()async{
    isLoading = true;
    notifyListeners();
    final response = await SettingRepo().getTermsConndition();
    if(response['content'] != null){
      terms = response['content'];
      isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void> getPolicyApi()async{
    isLoading = true;
    notifyListeners();
    final response = await SettingRepo().getPrivacyPolicy();
    if(response['content'] != null){
      policy = response['content'];
      isLoading = false;
      notifyListeners();
    }
  }
}
