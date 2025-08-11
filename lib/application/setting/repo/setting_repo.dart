import 'package:hunting_app/api_serivce/api_service.dart';
import 'package:hunting_app/constant/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingRepo {
  Future<List<dynamic>> getPlan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await ApiService().getList(
      AppUrls.getPlanUrl,
      authToken: prefs.getString('authToken'),
    );

    return response;
  }
  Future<Map<String, dynamic>> createSubscription(
    Map<String, dynamic> data,
    String id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await ApiService().postDataRegular(
     authToken: prefs.getString("authToken"), "${AppUrls.creatSubscription}$id/",
     data
    );
    return response;
  }
 Future<Map<String, dynamic>> getPrivacyPolicy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await ApiService().getData(
      AppUrls.privacyPolicy,
      authToken: prefs.getString('authToken'),
    );

    return response;
  }
   Future<Map<String, dynamic>> getTermsConndition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await ApiService().getData(
      AppUrls.termConditonUrl,
      authToken: prefs.getString('authToken'),
    );

    return response;
  }
}
