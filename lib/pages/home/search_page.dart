import 'package:flutter/material.dart';
import 'package:rizqicell/theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController? _textEditingController = TextEditingController();

  List<String> productList = [
    'LCD Xiaomi Redmi Note 2',
    'Tempered Glass Samsung S22',
    'LCD Vivo X20',
    'Kabel Data Type C',
    'Speaker Jumbo XTM 2000'
  ];

  List<String> productOnSearch = [];

  List images = [
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg',
    'assets/products/lcd_xiao_1.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          backgroundColor: bgColorGrey,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white54),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    productOnSearch = productList
                        .where(
                          (element) => element.toLowerCase().contains(
                                value.toLowerCase(),
                              ),
                        )
                        .toList();
                  });
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                    hintText: 'Cari produk '),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: _textEditingController!.text.isNotEmpty && productOnSearch.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 46,
                    ),
                    Text(
                      'Data Tidak Ditemukan',
                      style: primaryTextStyle.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: _textEditingController!.text.isNotEmpty
                    ? productOnSearch.length
                    : productList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  images[index],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          _textEditingController!.text.isNotEmpty
                              ? productOnSearch[index]
                              : productList[index],
                          style: primaryTextStyle.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                  );
                }));
  }
}
