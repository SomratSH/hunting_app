// import 'package:go_router/go_router.dart';
// import 'package:hunting_app/presentation/home_screen/home_screen.dart';
// import 'package:hunting_app/presentation/hunts/hunts_screen.dart';
// import 'package:hunting_app/presentation/map/map_screen.dart';
// import 'package:hunting_app/presentation/setting/setting_screen.dart';
// import '../presentation/landing_page/landing_page.dart'; // updated version shown below

// final GoRouter router = GoRouter(
//   initialLocation: '/home',
//   routes: [
   
//     ShellRoute(
//       builder: (context, state, child) => LandingPage(child: child, location: state.path.toString(),),
//       routes: [
//         GoRoute(
//           path: '/home',
//           builder: (context, state) => const HomeScreen(),
//         ),
//         GoRoute(
//           path: '/hunts',
//           builder: (context, state) => const HuntsScreen(),
//         ),
//         GoRoute(
//           path: '/map',
//           builder: (context, state) => const MapScreen(),
//         ),
//         GoRoute(
//           path: '/settings',
//           builder: (context, state) => const SettingScreen(),
//         ),
//       ],
//     ),
//   ],
// );
