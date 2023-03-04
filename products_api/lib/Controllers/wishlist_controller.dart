import 'package:get/get.dart';
import 'package:products_api/Models/wishlist_model.dart';
import 'package:products_api/Services/wishlist_services.dart';

class WishlistController extends GetxController {
  RxBool loading3 = false.obs;
  RxString error3 = ''.obs;

  List<WishlistResponse> wishlist = [];
  WishlistResponse wishlistResponse = WishlistResponse();

  // @override
  // void onInit() {
  //   PostWishlistController(id);
  //   super.onInit();
  // }

  void postWishlistController(List<dynamic> id) async {
    loading3.value = true;
    error3.value = '';

    var res = await WishlistService.postWishlist(id);
    loading3.value = false;

    if (res is WishlistResponse) {
      loading3.value = false;
      wishlistResponse = res;

      // Get.snackbar("Successfullly", wishlist.toString(),
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.black,
      //     colorText: Colors.white);
      // print(res);
    } else {
      loading3.value = false;
      error3.value = res.toString();
    }
  }
}
