import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rizqicell/providers/wishlist_provider.dart';
import 'package:rizqicell/theme.dart';
import 'package:rizqicell/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    // Widget appbar
    Widget header() {
      return AppBar(
        backgroundColor: primaryColor,
        title: const Text('Wishlist'),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    // Wishlist Kosong
    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bgColorGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_wishlist.png',
                width: 74,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Belum punya produk favorit?',
                style: primaryTextStyle.copyWith(
                    fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Cari produk yang mungkin anda inginkan',
                style: secondaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Cari Produk',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    //Wishlist Isi
    Widget content() {
      return Expanded(
        child: Container(
          color: bgColorGrey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            children:
                // wishlistProvider.wishlist.map((product) => WishlistCard()).toList();
                wishlistProvider.wishlist
                    .map(
                      (product) => WishlistCard(product),
                    )
                    .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // emptyWishlist(),
        content(),
      ],
    );
  }
}
