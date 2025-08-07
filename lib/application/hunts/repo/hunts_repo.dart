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
}
