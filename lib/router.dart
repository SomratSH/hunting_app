
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

// class AppRouter {
 

//   static final GoRouter router = GoRouter(
//     navigatorKey: _rootNavigatorKey,
//     debugLogDiagnostics: true,
//     initialLocation: CustomRoutePaths.onboard,
//     routes: [
//       GoRoute(
//         path: CustomRoutePaths.dashboard,
//         builder: (context, state) => ScreenDashboardShell(),
//       ),
//       GoRoute(
//         path: CustomRoutePaths.login,
//         builder: (context, state) => const ScreenLogin(),
//       ),
//       GoRoute(
//         path: CustomRoutePaths.otpVerify,
//         builder: (context, state) => const ScreenOtpVerify(),
//       ),
//       GoRoute(
//         path: CustomRoutePaths.onboard,
//         builder: (context, state) => const ScreenOnboard(),
//       ),
//       GoRoute(
//         path: CustomRoutePaths.screenConnectOnBoard,
//         builder: (context, state) => ScreenConnectOnboard(),
//       ),
//       GoRoute(
//         path: CustomRoutePaths.subscription,
//         builder: (context, state) => const ScreenSubscription(),
//       ),
//       GoRoute(
//         path: CustomRoutePaths.prescription,
//         builder: (context, state) => const ScreenPrescription(),
//       ),
//       // GoRoute(
//       //   path: CustomRoutePaths.emoji,
//       //   builder: (context, state) => const ScreenEmoji(),
//       // ),
//       GoRoute(
//         path: CustomRoutePaths.mood,
//         builder: (context, state) => const ScreenMoodCheckIn(),
//       ),
//       GoRoute(
//         path: CustomRoutePaths.calibration,
//         builder: (context, state) => const ScreenCalibration(),
//       ),
//       // Dashboard Shell Route
//       // ShellRoute(
//       //   builder: (context, state, child) {
//       //     return ScreenDashboardShell(
//       //       child: state.fullPath == CustomRoutePaths.dashboard ? null : child,
//       //     );
//       //   },
//       //   routes: [
//       //     GoRoute(
//       //       path: CustomRoutePaths.home,
//       //       builder: (context, state) => const ScreenHome(),
//       //     ),
//       //     GoRoute(
//       //       path: CustomRoutePaths.plan,
//       //       builder: (context, state) => const ScreenPlanHope(),
//       //     ),
//       //     GoRoute(
//       //       path: '/calendar',
//       //       builder: (context, state) => const ScreenCalendar(),
//       //       routes: [
//       //         GoRoute(
//       //           path: 'emoji',
//       //           builder: (context, state) => const ScreenEmoji(),
//       //         ),
//       //       ],
//       //     ),
//       //     GoRoute(
//       //       path: CustomRoutePaths.more,
//       //       builder: (context, state) => const ScreenMore(),
//       //     ),
//       //   ],
//       // ),
//     ],
    
//   );
// }

// class CustomRoutePaths {
//   static const String root = '/';
//   static const String signUp = "/create-account";
//   static const String dashboard = '/dashboard';


// // Authentication
//   static const String login = '/login';
//   static const String otpVerify = '/otp-verify';
//   static const String subscription = '/subscription';
//   static const String resetPassword = '/reset-password';
//   static const String updatePassword = '/update-password';




// }
