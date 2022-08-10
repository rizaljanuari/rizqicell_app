import 'package:flutter/material.dart';
import 'package:rizqicell/models/product_model.dart';
import 'package:rizqicell/pages/product_page.dart';
import 'package:rizqicell/theme.dart';

class ProductCard extends StatelessWidget {
  // const ProductCard({Key? key, this.product}) : super(key: key);
  final ProductModel? product;
  ProductCard(this.product);

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
        width: 215,
        height: 278,
        margin: const EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColorWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              // product.galleries[0].url,
              '${product?.galleries?[0].url}',
              width: 215,
              height: 150,
              // fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    // product.category.name,
                    '${product?.category?.name}',
                    style: secondaryTextStyle.copyWith(color: secondaryText),
                  ),
                  Text(
                    // product.name,
                    '${product?.name}',
                    style: primaryTextStyle.copyWith(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Rp. ${product?.price}',
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
