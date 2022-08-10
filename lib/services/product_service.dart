import 'dart:convert';
import 'package:rizqicell/models/product_model.dart';
import 'package:rizqicell/models/user_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'https://rizqicellular.com/backend/public/api';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Gagal get produk');
    }
  }
}
