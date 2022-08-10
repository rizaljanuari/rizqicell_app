import 'package:flutter/material.dart';
import 'package:rizqicell/models/product_model.dart';
import 'package:rizqicell/pages/product_page.dart';
import 'package:rizqicell/theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              product: product,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: 10,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                // product.galleries[0].url,
                '${product.galleries?[0].url}',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.category?.name}',
                    style: secondaryTextStyle.copyWith(color: secondaryText),
                  ),
                  Text(
                    '${product.name}',
                    style: primaryTextStyle.copyWith(fontSize: 20),
                    // overflow: TextOverflow.ellipsis,
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    '${product.price}',
                    style:
                        priceStyle.copyWith(fontSize: 18, fontWeight: semiBold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
