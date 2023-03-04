import 'package:flutter/material.dart';

import '../../firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash',
          style: TextStyle(fontSize: 25, color: Colors.pink),
        ),
      ),
      // body: Center(
      //   child: GestureDetector(
      //     onTap: () {
      //       Timer(
      //           const Duration(seconds: 3),
      //           () => Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const LoginScreen())));
      //       // code to execute when the text is tapped
      //     },
      //     child: const Text(
      //       'Firebase Practice',
      //       style: TextStyle(fontSize: 40, color: Colors.pink),
      //     ),
      //   ),
      // ),
    );
  }
}
