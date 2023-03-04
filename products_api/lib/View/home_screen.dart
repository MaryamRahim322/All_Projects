import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/Controllers/product_controller.dart';
import 'package:products_api/View/single_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products API'),
      ),
      body: Obx(
        () => productsController.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : productsController.error.value != ''
                ? Center(child: Text(productsController.error.value))
                : ListView.builder(
                    itemCount: productsController.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: index % 2 == 0 ? Colors.grey : Colors.amber,
                            borderRadius: BorderRadius.circular(14)),
                        // height: 3.0.h,
                        child: Padding(
                          padding: const EdgeInsets.all(26.0),
                          child: GestureDetector(
                            onTap: () async {
                              // productsController.productId =
                              //     productsController.products[index].id!;

                              Get.to(() => SingleProductScreen(
                                    id: productsController.products[index].id ??
                                        0,
                                  ));
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ClipRRect(
                                    //   borderRadius: const BorderRadius.only(
                                    //       topLeft: Radius.circular(10),
                                    //       topRight: Radius.circular(10)),
                                    //   child: Image.network(
                                    //     "${Appurls.baseUrl2}${productsController.productsResponse.image}",
                                    //     fit: BoxFit.cover,
                                    //   ),
                                    //   //   Image.asset(
                                    //   // AppImageResources.property,

                                    //   // ),
                                    // ),
                                    Text(
                                      " id: ${productsController.products[index].id ?? ""}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      " price: ${productsController.products[index].price ?? ""}",
                                    ),
                                    Text(
                                        " title: ${productsController.products[index].title ?? ""}"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        " description: ${productsController.products[index].description ?? ""}"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),

        ////////////////////////////
      ),
    );
  }
}
