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
}
