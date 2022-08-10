import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rizqicell/models/user_model.dart';
import 'package:rizqicell/providers/auth_provider.dart';

import '../../theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    // Widget appbar
    Widget header() {
      return AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 68,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.name}',
                        style: whiteTextStyle.copyWith(
                            fontWeight: bold, fontSize: 28),
                      ),
                      Text(
                        '@${user.username}',
                        style: secondaryTextStyle.copyWith(
                            color: Colors.grey, fontSize: 18),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign_in', (route) => false);
                  },
                  child: Image.asset(
                    'assets/icon_exit.png',
                    width: 24,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    // Widget item menu
    Widget menuItem(String text) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: primaryColor,
            )
          ],
        ),
      );
    }

    //Widget content
    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: const BoxDecoration(color: bgColorGrey),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Akun',
                style: primaryTextStyle.copyWith(
                    fontSize: 28, fontWeight: semiBold),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit_profile');
                  },
                  child: menuItem('Edit Profile')),
              menuItem('Order'),
              menuItem('Bantuan'),
              //////
              const SizedBox(
                height: 30,
              ),
              Text(
                'General',
                style: primaryTextStyle.copyWith(
                    fontSize: 28, fontWeight: semiBold),
              ),
              menuItem('Privacy & Policy'),
              menuItem('Term of Service'),
              menuItem('Rate App'),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
