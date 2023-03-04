import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getstatemanagment/view_models/Practice/Controllers.dart';
import 'package:getstatemanagment/view_models/Practice/Login_signup.dart';
import 'package:getstatemanagment/view_models/Practice/example_two.dart';
import 'package:getstatemanagment/view_models/Practice/image_picker.dart';
import 'package:getstatemanagment/view_models/Practice/localization.dart';
import 'package:getstatemanagment/view_models/Practice/mark_favrt.dart';

class HomeScreenState extends StatefulWidget {
  const HomeScreenState({super.key});

  @override
  State<HomeScreenState> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {
  // int x = 20;

  final CounterController controller = Get.put(CounterController());

  @override
  void initState() {
    super.initState();
    // Timer.periodic(const Duration(milliseconds: 22), (timer) {
    //   x++;
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(title: const Text('GetX')),
      body: Column(
        children: [
          Center(
            child: Obx(() {
              return Text(
                controller.counter.toString(),
                style: const TextStyle(fontSize: 30),
              );
            }),
          ),
          Card(
            child: ListTile(
              title: const Text("GetxDialog Alert"),
              subtitle: const Text("Getx dialog alert"),
              onTap: () {
                Get.defaultDialog(
                  title: "Delete Chat",
                  contentPadding: const EdgeInsets.all(20),
                  middleText: "Are you sure you want to delete chat?",
                  confirm: TextButton(
                      onPressed: () {
                        // Navigator.pop(context);
                        Get.back();
                      },
                      child: const Text('OK')),
                  cancel: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel')),

                  // textConfirm: "Yes",
                  // textCancel: "No"
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Bottom Sheet"),
              subtitle: const Text("Getx dialog alert"),
              onTap: () {
                Get.bottomSheet(Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.light_mode),
                        title: const Text('Light Theme'),
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                        },
                      ),
                      ListTile(
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                        },
                        leading: const Icon(Icons.dark_mode),
                        title: const Text('Dark Theme'),
                      )
                    ],
                  ),
                ));
              },
            ),
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    //
                    Get.toNamed('/screenOne', arguments: ['a', 'b']);
                  },
                  child: const Text('Go to next screen'))),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    //
                    Get.to(const ExampleTwo());
                  },
                  child: const Text('Go to Example Two Slider'))),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    //
                    Get.to(const LoginSignupScreen());
                  },
                  child: const Text('Go to Post API'))),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    Get.to(const FavouriteAppScreen());
                  },
                  child: const Text('Go to Favourite App'))),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    Get.to(const ImagePickerScreen());
                  },
                  child: const Text('Go to Image Picker'))),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    //
                    Get.to(const LocalizationScreen());
                  },
                  child: const Text('Go to Localization Screen'))),
          Expanded(
              child: ListView.builder(
                  itemCount: 1000,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(index.toString()),
                    );
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementCounter();
          Get.snackbar(
            'Mishu',
            "A flutter Developr",
            backgroundColor: Colors.black38,
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.person),
            onTap: (snack) {},
          );
          // x++;
          // setState(() {
          //   x++;
          // });
        },
      ),
    );
  }
}
