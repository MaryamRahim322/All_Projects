import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstatemanagment/res/routes/routes.dart';
import 'package:getstatemanagment/view/splash_screen.dart';

import 'package:getstatemanagment/view_models/Practice/languages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      translations: Languages(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const MainScreen(),
      home: const SplashScreen(),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.light),
      getPages: ApppRoutes.appRouts(),
      // getPages: [
      //   GetPage(name: '/', page: () => const HomeScreenState()),
      //   GetPage(name: '/screenOne', page: () => Screenone()),
      //   GetPage(name: '/screenTwo', page: () => const Screentwo()),
      // ],
    );
  }
}
