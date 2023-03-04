import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  final controller = Get.put(FavouriteController());
  // List<String> languageList = [
  //   'Java',
  //   'Flutter',
  //   'Python',
  //   'Dart',
  //   'React',
  //   "JavaScript",
  //   'HTML',
  //   'CSS',
  //   'Swift'
  // ];
  // List<String> tempList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mark Favourite App')),
      body: ListView.builder(
          itemCount: controller.languageList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  onTap: () {
                    if (controller.tempList
                        .contains(controller.languageList[index].toString())) {
                      controller.removeFromFavourite(
                          controller.languageList[index].toString());
                    } else {
                      controller.addToFavourite(
                          controller.languageList[index].toString());
                    }
                    // setState(() {});
                  },
                  title: Text(controller.languageList[index].toString()),
                  trailing: Obx(
                    () => Icon(
                      Icons.favorite,
                      color: controller.tempList.contains(
                              controller.languageList[index].toString())
                          ? Colors.red
                          : Colors.white,
                    ),
                  )),
            );
          }),
    );
  }
}
