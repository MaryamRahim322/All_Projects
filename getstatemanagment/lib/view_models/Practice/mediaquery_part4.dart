import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaQueryScreen extends StatefulWidget {
  var name;
  MediaQueryScreen({super.key, this.name});

  @override
  State<MediaQueryScreen> createState() => _MediaQueryScreenState();
}

class _MediaQueryScreenState extends State<MediaQueryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen One' " " + Get.arguments[0])),
      body: Column(
        children: [
          SizedBox(
            // height: MediaQuery.of(context).size.height*1,
            height: Get.height * .2,
            width: Get.width * .2,
            child: const Center(child: Text('Center')),
          ),
        ],
      ),
    );
  }
}
