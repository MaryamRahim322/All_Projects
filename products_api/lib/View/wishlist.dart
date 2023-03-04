import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/Controllers/wishlist_controller.dart';
import 'package:products_api/View/get_wishlist.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  var wishlistcontroller = Get.put(WishlistController());

  List<dynamic> ids = [];
// for get method
  // @override
  // void initState() {
  //   print("+++++++++++++++++++++++++++++");

  //   super.initState();
  //   wishlistcontroller.PostWishlistController(171);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Wishlist')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    // print(ids);
                    wishlistcontroller.postWishlistController(ids);
                    Get.to(const GetDataWishlist());
                  },
                  child: const Text('Click'))),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                ids.add(171);
              },
              child: const Text(
                'id: 171',
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                ids.add(172);
              },
              child: const Text(
                'id: 172',
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                ids.add(173);
              },
              child: const Text(
                'id: 173',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}
