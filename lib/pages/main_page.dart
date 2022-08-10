import 'package:flutter/material.dart';
import 'package:rizqicell/pages/home/search_page.dart';
import 'package:rizqicell/pages/home/home_page.dart';
import 'package:rizqicell/pages/home/profile_page.dart';
import 'package:rizqicell/pages/home/wishlist_page.dart';
import 'package:rizqicell/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  // widget keranjang
  Widget cartButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/cart');
      },
      backgroundColor: secondaryColor,
      child: Image.asset(
        'assets/icon_cart.png',
        width: 20,
      ),
    );
  }

  // widget custom navigation bar
  Widget customBottomNav() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: bgColorBlack,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/icon_home.png',
                  width: 20,
                  color: currentIndex == 0 ? secondaryColor : bgColorGrey,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  margin: const EdgeInsets.only(top: 10, right: 40),
                  child: Icon(
                    Icons.search,
                    size: 25,
                    color: currentIndex == 1 ? secondaryColor : bgColorGrey,
                  )
                  // Image.asset(
                  //   'assets/icon_chat.png',
                  //   width: 20,
                  //   color: currentIndex == 1 ? secondaryColor : bgColorGrey,
                  // ),
                  ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10, left: 40),
                child: Image.asset(
                  'assets/icon_wishlist.png',
                  width: 20,
                  color: currentIndex == 2 ? secondaryColor : bgColorGrey,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/icon_profile_bottom.png',
                  width: 20,
                  color: currentIndex == 3 ? secondaryColor : bgColorGrey,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  //
  //////////////// Widget body
  //
  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return SearchPage();
      case 2:
        return const WishlistPage();
      case 3:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorGrey,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
