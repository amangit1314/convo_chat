// import 'package:convo_chat/features/auth/presentation/login/login_screen.dart';
// import 'package:convo_chat/features/auth/presentation/otp/generate_otp_screen.dart';
// import 'package:convo_chat/features/auth/presentation/otp/verify_otp_screen.dart';
// import 'package:convo_chat/features/nav/presentation/profile/profile.dart';
// import 'package:flutter/material.dart';

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case LoginScreen.routeName:
//       return MaterialPageRoute(builder: (context) => const Login());
//     case GenerateOtpScreen.routeName:
//       return MaterialPageRoute(builder: (context) => const GenerateOtpScreen());
//     case VerifyOtpScreen.routeName:
//       final verificationId = settings.arguments as String;
//       return MaterialPageRoute(
//           builder: (context) =>
//               VerifyOtpScreen(verificationId: verificationId));
//     case Profile.routeName:
//       return MaterialPageRoute(
//         builder: (context) => const Profile(
//           email: '',
//           userName: '',
//         ),
//       );
//     default:
//       return MaterialPageRoute(
//         builder: (context) => const Scaffold(
//             body: ErrorScreen(error: 'This page doesn\'t exist')),
//       );
//   }
// }

// class ErrorScreen extends StatelessWidget {
//   final String error;
//   const ErrorScreen({super.key, required this.error});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(error),
//       ),
//     );
//   }
// }
