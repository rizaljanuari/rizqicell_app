import 'package:flutter/material.dart';
import 'package:rizqicell/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColorBlack,
        centerTitle: true,
        title: const Text('Checkout Sukses'),
        elevation: 0,
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_rounded,
              size: 120,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Transaksi kamu telah berhasil!',
              style: secondaryTextStyle.copyWith(
                  color: secondaryTextWhite, fontSize: 22, fontWeight: bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Tunggu sampai barang pesananmu sampai \nKami siapkan dulu pesananmu sepenuh hati :)',
              style: secondaryTextStyle.copyWith(
                  color: Colors.white54, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 196,
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: Text(
                  'Cari Barang Lain yuk!',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      color: secondaryTextWhite,
                      fontSize: 18),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              width: 196,
              height: 44,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Lihat Pesanan Kamu',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      color: secondaryTextWhite,
                      fontSize: 18),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: bgColorBlack2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: header(),
      body: content(),
    );
  }
}
