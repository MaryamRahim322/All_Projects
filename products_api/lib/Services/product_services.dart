import 'package:http/http.dart' as http;
import 'package:products_api/Models/product_model.dart';
import 'package:products_api/Utils/Constants/base_client.dart';

class ProductsService {
  static Future<dynamic> getProducts() async {
    var url = 'https://fakestoreapi.com/products';
    try {
      var resp = await BaseClientClass.get(url, "");

      if (resp is http.Response) {
        return myProductResponseFromJson(resp.body);
      } else {
        return resp;
      }
    } catch (e) {
      return e;
    }
  }
}
