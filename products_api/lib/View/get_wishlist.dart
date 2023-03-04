import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/Controllers/wishlist_controller.dart';

class GetDataWishlist extends StatefulWidget {
  const GetDataWishlist({super.key});

  @override
  State<GetDataWishlist> createState() => _GetDataWishlistState();
}

class _GetDataWishlistState extends State<GetDataWishlist> {
  var wishlistcontroller = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('GetData')),
        body: Obx(() => wishlistcontroller.loading3.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: wishlistcontroller.wishlistResponse.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 200,
                        width: 100,
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " Id: ${wishlistcontroller.wishlistResponse.data![index].authorId.toString()}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  // wishlistcontroller.wishlistResponse.data![index].id??"";
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                " Price : ${wishlistcontroller.wishlistResponse.data![index].price.toString()}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                " Description : ${wishlistcontroller.wishlistResponse.data![index].description.toString()}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                " location : ${wishlistcontroller.wishlistResponse.data![index].location.toString()}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 19),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                " City : ${wishlistcontroller.wishlistResponse.data![index].city!.countryId.toString()}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 19),
                              ),
                            ),
                            Text(wishlistcontroller
                                    .wishlistResponse.data![index].content ??
                                "")
                          ],
                        )),
                  );
                })));
  }
}
