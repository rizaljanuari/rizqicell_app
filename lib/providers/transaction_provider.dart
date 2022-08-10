import 'package:flutter/cupertino.dart';
import 'package:rizqicell/models/cart_model.dart';
import 'package:rizqicell/services/transaction_service.dart';

// class TransactionProvider with ChangeNotifier {
//   Future<bool> checkout(
//       String token, List<CartModel> carts, double totalPrice) async {
//     try {
//       if (await TransactionService().checkout(token, carts, totalPrice)) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }
class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
