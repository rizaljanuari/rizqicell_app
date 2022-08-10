import 'package:flutter/material.dart';
import 'package:rizqicell/models/product_model.dart';

import '../theme.dart';

class SearchCard extends StatelessWidget {
  // const SearchCard({Key? key}) : super(key: key);
  final ProductModel product;
  SearchCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                // 'test gambar',
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
                    // 'test kategori product',
                    style: secondaryTextStyle.copyWith(color: secondaryText),
                  ),
                  Text(
                    '${product.name}',
                    // 'test nama product',
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
