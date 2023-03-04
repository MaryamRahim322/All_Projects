/////////
import 'package:http/http.dart' as http;
import 'package:products_api/Models/singleproduct_model.dart';
import 'package:products_api/Utils/Constants/app_url.dart';
import 'package:products_api/Utils/Constants/base_client.dart';

class SingleProductsService {
  static Future<dynamic> getSingleProduct(int id) async {
    var url = "${Appurls.baseUrl}${Appurls.singleproduct}$id";
    try {
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return singleProductResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
