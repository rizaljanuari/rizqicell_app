import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rizqicell/providers/auth_provider.dart';
import 'package:rizqicell/providers/cart_provider.dart';
import 'package:rizqicell/providers/transaction_provider.dart';
import 'package:rizqicell/theme.dart';
import 'package:rizqicell/widgets/checkout_card.dart';

class CheckoutPage extends StatelessWidget {
  // const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // handleChekout() async {
    //   if (await transactionProvider.checkout(
    //     authProvider.user.token.toString(),
    //     cartProvider.carts,
    //     cartProvider.totalPrice(),
    //   )) {
    //     cartProvider.carts == [];
    //     Navigator.pushNamedAndRemoveUntil(
    //       context,
    //       '/checkout-success',
    //       (route) => false,
    //     );
    //   }

    handleCheckout() async {
      if (await transactionProvider.checkout(
        authProvider.user.token.toString(),
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout_success', (route) => false);
      }
    }

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColorBlack,
        centerTitle: true,
        title: const Text('Checkout'),
        elevation: 0,
      );
    }

    Widget customBottom(BuildContext context) {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(
            // top: defaultMargin,
            left: defaultMargin,
            right: defaultMargin,
            bottom: 20),
        child: TextButton(
          onPressed: handleCheckout,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.green),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              'Selesai',
              style:
                  whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Item',
                  style:
                      primaryTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                ),
                Column(
                  children: cartProvider.carts
                      .map((cart) => CheckoutCard(cart))
                      .toList(),
                ),
              ],
            ),
          ),
          //
          // ADDRESS ////////////////////////////////////////////////////
          //
          Container(
            margin: const EdgeInsets.only(top: defaultMargin),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColorWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Alamat',
                  style: primaryTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon_store_location.png',
                          width: 60,
                        ),
                        Image.asset(
                          'assets/icon_line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icon_your_location.png',
                          width: 60,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lokasi Pengiriman',
                          style: primaryTextStyle.copyWith(
                              color: secondaryText, fontSize: 16),
                        ),
                        Text(
                          'Rizqi Cellular',
                          style: primaryTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Text(
                          'Lokasi Penerima',
                          style: primaryTextStyle.copyWith(
                              color: secondaryText, fontSize: 16),
                        ),
                        Text(
                          'Jl. Laswi No. 16 Desa Ciparay',
                          style: primaryTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Icon(
                      Icons.edit,
                      size: 22,
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //
          // PAYMENT ////////////////////////////////////////////////////
          //
          Container(
            margin: const EdgeInsets.only(top: defaultMargin),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColorWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Pembayaran',
                  style: primaryTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jumlah Produk',
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, color: secondaryText),
                    ),
                    Text(
                      '${cartProvider.totalItem()} items',
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jumlah Harga',
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, color: secondaryText),
                    ),
                    Text(
                      'Rp. ${cartProvider.totalPrice()}',
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biaya Pengiriman',
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, color: secondaryText),
                    ),
                    Text(
                      'GRATIS',
                      style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                          color: Colors.green),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 0.5,
                  color: bgColorBlack,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TOTAL',
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, fontWeight: bold),
                    ),
                    Text(
                      'Rp. ${cartProvider.totalPrice()}',
                      style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                          color: priceColor),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: customBottom(context),
    );
  }
}
