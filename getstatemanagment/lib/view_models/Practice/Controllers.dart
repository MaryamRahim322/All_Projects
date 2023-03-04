import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

// for exmple 1
class CounterController extends GetxController {
  RxInt counter = 0.obs;
  incrementCounter() {
    counter.value++;
  }
}

// for example two

class ExampleTwoControlller extends GetxController {
  RxDouble opacity = .4.obs;
  setOpacity(double value) {
    opacity.value = value;
  }
}

// Favorite Controller

class FavouriteController extends GetxController {
  RxList<String> languageList = [
    'Java',
    'Flutter',
    'Python',
    'Dart',
    'React',
    "JavaScript",
    'HTML',
    'CSS',
    'Swift',
    'Pythonn',
    "Laravel",
    'HTMLL',
    'PHP',
    'Angular'
  ].obs;

  RxList tempList = [].obs;

  addToFavourite(String value) {
    tempList.add(value);
  }

  removeFromFavourite(String value) {
    tempList.remove(value);
  }
}

//  Image Picker Controller

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    } else {
      const Text('No Image Selected');
    }
  }
}

// Login Controller
class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool loading = false.obs;
  void loginApi() async {
    loading.value = true;
    try {
      final response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {
            "email": emailController.value.text,
            "password": passwordController.value.text
          });

      var data = jsonDecode(response.body);
      // print(response.statusCode);
      // print(data);
      if (response.statusCode == 200) {
        loading.value = false;

        Get.snackbar(' Login Successfully', 'Welcom');
      } else {
        loading.value = false;

        Get.snackbar('Login Failed', data['error']);
      }
    } catch (e) {
      loading.value = false;

      Get.snackbar('Exception', e.toString());
    }
  }
}
