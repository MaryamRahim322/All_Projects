// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:products_api/Models/product_model.dart';
import 'package:products_api/Models/singleproduct_model.dart';
import 'package:products_api/Services/product_services.dart';
import 'package:products_api/Services/singleproduct_services.dart';

class ProductsController extends GetxController {
  RxBool loading = false.obs;
  RxString error = ''.obs;

  RxBool loading2 = false.obs;
  RxString error2 = ''.obs;
  List<MyProductResponse> products = [];
  var singleproductmodel = SingleProductResponse();

  int? productId;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

// for Products
  void getProducts() async {
    loading.value = true;
    error.value = '';

    var res = await ProductsService.getProducts();
    loading.value = false;

    if (res is List<MyProductResponse>) {
      products = res;
      loading.value = false;

      ///  print(res);
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

  // For SINGLE PRODUCTS

  void getSingleProducts(int id) async {
    loading2.value = true;
    error2.value = '';

    var res = await SingleProductsService.getSingleProduct(id);
    loading2.value = false;

    if (res is SingleProductResponse) {
      singleproductmodel = res;
      loading2.value = false;
      // print(res);
    } else {
      loading2.value = false;
      error2.value = res.toString();
    }
  }
}
