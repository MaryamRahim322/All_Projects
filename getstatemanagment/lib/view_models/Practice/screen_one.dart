import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstatemanagment/view_models/Practice/screen_two.dart';

class Screenone extends StatefulWidget {
  var name;
  Screenone({super.key, this.name});

  @override
  State<Screenone> createState() => _ScreenoneState();
}

class _ScreenoneState extends State<Screenone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen One' " " + Get.arguments[0])),
      body: Container(
        child: Center(
          child: TextButton(
              onPressed: () {
                Get.to(const Screentwo());
              },
              child: const Text('Go to nxt screen')),
        ),
      ),
    );
  }
}
