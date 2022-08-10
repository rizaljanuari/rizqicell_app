import 'package:flutter/material.dart';
import 'package:rizqicell/models/cart_model.dart';
import 'package:rizqicell/theme.dart';

class CheckoutCard extends StatelessWidget {
  // const CheckoutCard({Key? key}) : super(key: key);
  final CartModel cart;
  CheckoutCard(this.cart);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: bgColorWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                '${cart.product!.galleries![0].url}',
                height: 40,
                width: 40,
              )
              // Container(
              //   width: 60,
              //   height: 60,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     image: const DecorationImage(
              //         image: AssetImage('assets/products/lcd_xiao_1.jpg'),
              //         fit: BoxFit.cover),
              //   ),
              // ),
              ,
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cart.product!.name}',
                      style: primaryTextStyle.copyWith(
                          fontSize: 20, fontWeight: bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${cart.product!.price}',
                      style: priceStyle.copyWith(
                          fontWeight: semiBold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                '${cart.quantity}',
                style: primaryTextStyle.copyWith(
                    color: secondaryText, fontSize: 16),
              )
            ],
          ),
        ],
      ),
    );
  }
}
