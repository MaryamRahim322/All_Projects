import 'package:flutter/material.dart';
import 'package:getstatemanagment/view_models/Responsive_Design/desktop-body.dart';
import 'package:getstatemanagment/view_models/Responsive_Design/mobile_body.dart';
import 'package:getstatemanagment/view_models/Responsive_Design/responsive_layout.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(title: const Text('Responsive dESIGN')),
      body: ResponsiveLayout(
        mobileBody: MobileBodyScreen(),
        desktopBody: DesktopBodyScreen(),
      ),
    );
    // final currentWidth = MediaQuery.of(context).size.width;
    // return Scaffold(
    //   backgroundColor:
    //       currentWidth < 600 ? Colors.amber : Colors.deepOrangeAccent,
    //   body: Center(
    //     child: Text(currentWidth.toString()),
    //   ),
    // );
  }
}
