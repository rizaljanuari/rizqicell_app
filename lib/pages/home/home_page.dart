import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:rizqicell/models/user_model.dart';
import 'package:rizqicell/providers/auth_provider.dart';
import 'package:rizqicell/providers/product_provider.dart';
import 'package:rizqicell/theme.dart';
import 'package:rizqicell/widgets/product_card.dart';
import 'package:rizqicell/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    // print(
    //     'Jumlah Produk HomePage: ${productProvider.products.map((product) => ProductCard()).toList()}');

    // Widget header
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 28, fontWeight: semiBold),
                  ),
                  Text(
                    '@${user.username}',
                    style: secondaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  Text(
                    'Selamat Berbelanja!',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: medium),
                  ),
                ],
              ),
            ),
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/icon_profile.png'),
                  // image: AssetImage(image:NetworkImage(user.profilePhotoUrl))
                ),
              ),
            )
          ],
        ),
      );
    }

    ////
    /// Widget Categories
    ///
    Widget categories() {
      return Container(
        margin: const EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor),
                child: Text(
                  'Semua Produk',
                  style: whiteTextStyle,
                ),
              ),
              ///////////////////
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor,
                    border: Border.all(color: secondaryText)),
                child: Text(
                  'LCD',
                  style: secondaryTextStyle,
                ),
              ),
              ///////////////////
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor,
                    border: Border.all(color: secondaryText)),
                child: Text(
                  'Touchscreen',
                  style: secondaryTextStyle,
                ),
              ),
              ///////////////////
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor,
                    border: Border.all(color: secondaryText)),
                child: Text(
                  'Headset',
                  style: secondaryTextStyle,
                ),
              ),
              ///////////////////
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor,
                    border: Border.all(color: secondaryText)),
                child: Text(
                  'Tempered Glass',
                  style: secondaryTextStyle,
                ),
              ),
            ],
          ),
        ),
      );
    }

    ////
    /// Widget title Populer
    ///
    Widget populerProductTitle() {
      return Container(
        margin: const EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Paling Banyak Dilihat',
          style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
      );
    }

    ////
    /// Widget Produk populer
    ///
    Widget popularProduct() {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: productProvider.products
                    .map(
                      (product) => ProductCard(product),
                    )
                    .toList(),

                // children: [
                //   ProductCard(),
                // ],
              ),
            ],
          ),
        ),
      );
    }

    ////
    /// Widget title Produk Terbaru
    ///
    Widget newArrivalProductTitle() {
      return Container(
        margin: const EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Produk Terbaru',
          style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
      );
    }

    ////
    /// Widget Produk Terbaru
    ///
    Widget newArrival() {
      return Container(
        margin: const EdgeInsets.only(top: 12, bottom: defaultMargin),
        child: Column(
            children: productProvider.products
                .map((product) => ProductTile(product))
                .toList()),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          const Divider(
            thickness: 4,
            color: primaryColor,
            indent: 20,
            endIndent: 160,
          ),
          categories(),
          populerProductTitle(),
          popularProduct(),
          newArrivalProductTitle(),
          newArrival(),
        ],
      ),
    );
  }
}
