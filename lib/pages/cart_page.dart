import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rizqicell/providers/cart_provider.dart';
import 'package:rizqicell/theme.dart';
import 'package:rizqicell/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  // const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColorBlack,
        centerTitle: true,
        title: const Text('Keranjang'),
        elevation: 0,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_keranjang.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Keranjang anda kosong!',
              style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            Text(
              'Cari produk yang anda inginkan',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            Container(
              width: 154,
              height: 44,
              margin: const EdgeInsets.only(top: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Cari Produk',
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: cartProvider.carts
            .map(
              (cart) => CartCard(cart),
            )
            .toList(),
      );
    }

    Widget customButtonNav() {
      return Container(
        height: 165,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle.copyWith(fontSize: 18),
                  ),
                  Text(
                    'Rp. ${cartProvider.totalPrice()}',
                    style:
                        priceStyle.copyWith(fontSize: 18, fontWeight: semiBold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Divider(
              thickness: 0.4,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.only(
                  // top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: secondaryColor),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Checkout',
                        style: whiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColorGrey,
      appBar: header(),
      // body: emptyCart(),
      body: cartProvider.carts.isEmpty ? emptyCart() : content(),
      bottomNavigationBar:
          cartProvider.carts.isEmpty ? const SizedBox() : customButtonNav(),
    );
  }
}
