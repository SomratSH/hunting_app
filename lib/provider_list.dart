import 'package:hunting_app/presentation/authentication/provider/authentication_provider.dart';
import 'package:hunting_app/presentation/home_screen/home_provider.dart';
import 'package:hunting_app/presentation/profile/profile_provider.dart';
import 'package:hunting_app/presentation/setting/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderList {
  static List<SingleChildWidget> get providers => [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_)=> ProfileProvider()..getProfile()),
        ChangeNotifierProvider(create: (_)=> HomeProvider()..getHunts()),
        ChangeNotifierProvider(create: (_)=> SettingProvider()..getPlanList())
      ];
}
