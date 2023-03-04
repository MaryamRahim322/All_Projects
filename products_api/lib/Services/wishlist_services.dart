import 'package:products_api/Models/wishlist_model.dart';
import 'package:products_api/Utils/Constants/base_client.dart';
import 'package:http/http.dart' as http;

class WishlistService {
  static Future<dynamic> postWishlist(List<dynamic> id) async {
    Map data = {"properties": id};

    var url = "http://realestate.tecrux.solutions/api/v1/wishlist";
    try {
      var res = await BaseClientClass.post(url, data);
      if (res is http.Response) {
        return wishlistResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
