import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rizqicell/models/product_model.dart';
import 'package:rizqicell/providers/wishlist_provider.dart';
import 'package:rizqicell/theme.dart';

class WishlistCard extends StatelessWidget {
  // const WishlistCard({Key? key}) : super(key: key);
  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: const EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: const EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: defaultMargin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // boxShadow: const [
        //   BoxShadow(
        //       blurRadius: 2,
        //       offset: Offset(2, 4),
        //       blurStyle: BlurStyle.inner,
        //       color: secondaryColor),
        // ],
        color: bgColorWhite,
      ),
      child: Row(
        children: [
          Image.network(
            '${product.galleries![0].url}',
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   '${product.category}',
                //   style: secondaryTextStyle.copyWith(color: secondaryText),
                // ),
                Text(
                  '${product.name}',
                  style: primaryTextStyle.copyWith(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Rp. ${product.price}',
                  style:
                      priceStyle.copyWith(fontSize: 14, fontWeight: semiBold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/icon_wishlist_red.png',
              width: 34,
            ),
          )
        ],
      ),
    );
  }
}
