import 'package:flutter/cupertino.dart';
import 'package:rizqicell/models/product_model.dart';

class SearchProvider with ChangeNotifier {
  List<ProductModel> _searchProduct = [];
  List<ProductModel> get searchProduct => _searchProduct;

  set searchProduct(List<ProductModel> searchProduct) {
    _searchProduct = searchProduct;
    notifyListeners();
  }
}
