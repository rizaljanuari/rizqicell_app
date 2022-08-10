// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rizqicell/pages/cart_page.dart';
import 'package:rizqicell/pages/checkout_page.dart';
import 'package:rizqicell/pages/checkout_success_page.dart';
import 'package:rizqicell/pages/edit_profile.dart';
import 'package:rizqicell/pages/home/search_page.dart';
import 'package:rizqicell/pages/main_page.dart';
import 'package:rizqicell/pages/product_page.dart';
import 'package:rizqicell/pages/signin_page.dart';
import 'package:rizqicell/pages/signup_page.dart';
import 'package:rizqicell/pages/splash_page.dart';
import 'package:rizqicell/providers/auth_provider.dart';
import 'package:rizqicell/providers/cart_provider.dart';
import 'package:rizqicell/providers/product_provider.dart';
import 'package:rizqicell/providers/search_provider.dart';
import 'package:rizqicell/providers/transaction_provider.dart';
import 'package:rizqicell/providers/wishlist_provider.dart';
// import 'theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign_in': (context) => const SignInPage(),
          '/sign_up': (context) => const SignUpPages(),
          '/home': (context) => const MainPage(),
          '/edit_profile': (context) => EditProfilePage(),
          // '/product': (context) =>  ProductPage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout_success': (context) => const CheckoutSuccessPage(),
          '/search': (context) => SearchPage(),
        },
      ),
    );
  }
}
