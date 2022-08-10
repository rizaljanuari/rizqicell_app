import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rizqicell/models/product_model.dart';
import 'package:rizqicell/providers/cart_provider.dart';
import 'package:rizqicell/providers/wishlist_provider.dart';
import 'package:rizqicell/theme.dart';

class ProductPage extends StatefulWidget {
  // const ProductPage({Key? key}) : super(key: key);
  final ProductModel? product;
  const ProductPage({Key? key, this.product}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int currentIndex = 0;
  // bool isWishlist = false;

  List images = [
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg',
  ];

  List produkRekomendasi = [
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: colorGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(40),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft, child: Icon(Icons.close)),
                  Icon(
                    Icons.check,
                    size: 80,
                    color: bgColorWhite,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "YEAAAH",
                    style: primaryTextStyle.copyWith(
                        color: bgColorWhite, fontWeight: bold, fontSize: 28),
                  ),
                  Text(
                    "Produk berhasil ditambahkan",
                    style: primaryTextStyle.copyWith(
                        color: bgColorWhite,
                        fontWeight: semiBold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    width: 156,
                    height: 48,
                    child: TextButton(
                      child: Text(
                        'Lihat Keranjang',
                        style: primaryTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    // print('Galeri yang didapat ${widget.product?.category?.name}');
    // widget indicator carousel
    Widget indicator(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Colors.grey,
        ),
      );
    }

    Widget produkRekomendasiCard(imageUrl) {
      return Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
            borderRadius: BorderRadius.circular(6)),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          // appbar
          Container(
            margin: const EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.chevron_left)),
                const Icon(Icons.shopping_bag)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CarouselSlider(
            items: widget.product?.galleries
                ?.map(
                  (image) => Image.network(
                    '${image.url}',
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.fitHeight,
                  ),
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      );
    }

    Widget content() {
      int index = -1;
      return Expanded(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: defaultMargin),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                color: bgColorBlack),
            child: Column(
              children: [
                // header
                Container(
                  margin: const EdgeInsets.only(
                      top: defaultMargin,
                      left: defaultMargin,
                      right: defaultMargin),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.product?.name}',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20, fontWeight: bold),
                            ),
                            Text(
                              '${widget.product?.category?.name}',
                              style: secondaryTextStyle.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   isWishlist = !isWishlist;
                          // });
                          wishlistProvider.setProduct(widget.product!);
                          if (wishlistProvider.isWishlist(widget.product!)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: priceColor,
                                content: Text(
                                  'Berhasil Menambahkan Produk di Wishlist',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: alertColor,
                                content: Text(
                                  'Berhasil Menghapus Produk di Wishlist',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        },
                        child: Image.asset(
                          // isWishlist
                          wishlistProvider.isWishlist(widget.product!)
                              ? 'assets/icon_wishlist_red.png'
                              : 'assets/icon_wishlist_off.png',
                          width: 46,
                        ),
                      ),
                    ],
                  ),
                ),
                // NOTE : PRICE
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(
                      top: defaultMargin,
                      left: defaultMargin,
                      right: defaultMargin),
                  decoration: BoxDecoration(
                    color: bgColorBlack2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Harga',
                        style: whiteTextStyle.copyWith(fontSize: 20),
                      ),
                      Text(
                        '${widget.product?.price}',
                        style: priceStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold),
                      ),
                    ],
                  ),
                ),
                // NOTE : Deskripsi
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: defaultMargin,
                      left: defaultMargin,
                      right: defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deskripsi',
                        style: whiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "${widget.product?.description}",
                        style: secondaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: light),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),

                // NOTE: PRODUK REKOMENDASI
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultMargin),
                        child: Text(
                          'Produk Rekomendasi',
                          style: whiteTextStyle.copyWith(
                              fontSize: 20, fontWeight: medium),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: produkRekomendasi.map((image) {
                            index++;
                            return Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? defaultMargin : 0),
                              child: produkRekomendasiCard(image),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),

                // NOTE : BUTTON
                Container(
                  height: 54,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: defaultMargin,
                      left: defaultMargin,
                      right: defaultMargin,
                      bottom: 30),
                  child: TextButton(
                    onPressed: () {
                      cartProvider.addCart(widget.product!);
                      showSuccessDialog();
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: secondaryColor),
                    child: Text(
                      'Tambahkan ke Keranjang',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [header(), content()],
        ),
      ),
    );
  }
}
