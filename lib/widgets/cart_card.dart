import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rizqicell/models/cart_model.dart';
import 'package:rizqicell/providers/cart_provider.dart';
import 'package:rizqicell/theme.dart';

class CartCard extends StatelessWidget {
  // const CartCard({Key? key}) : super(key: key);

  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  '${cart.product!.galleries![0].url}',
                  width: 60,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cart.product!.name}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$${cart.product!.price}',
                      style: priceStyle,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/icon_kurang.png',
                      width: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/icon_tambah.png',
                      width: 24,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id!);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.restore_from_trash_rounded,
                  color: Colors.red,
                  size: 16,
                ),
                Text(
                  'Hapus',
                  style: primaryTextStyle.copyWith(
                      color: alertColor, fontWeight: semiBold, fontSize: 16),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
