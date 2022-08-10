import 'package:flutter/material.dart';
import 'package:rizqicell/theme.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  Widget header() {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop;
        },
        icon: Icon(Icons.close),
      ),
      title: Text('Edit Profile'),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              width: 160,
              height: 160,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/icon_profile.png'))),
            ),
            nameInput(),
            usernameInput(),
            emailInput()
          ],
        ),
      ),
    );
  }

  Widget nameInput() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: secondaryTextStyle.copyWith(fontSize: 20),
          ),
          TextFormField(
            style: primaryTextStyle.copyWith(fontSize: 20),
            decoration: InputDecoration(
                hintText: 'Auauau',
                hintStyle: secondaryTextStyle.copyWith(fontSize: 20),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor))),
          )
        ],
      ),
    );
  }

  Widget usernameInput() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: secondaryTextStyle.copyWith(fontSize: 20),
          ),
          TextFormField(
            style: primaryTextStyle.copyWith(fontSize: 20),
            decoration: InputDecoration(
                hintText: '@Auauau',
                hintStyle: secondaryTextStyle.copyWith(fontSize: 20),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor))),
          )
        ],
      ),
    );
  }

  Widget emailInput() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: secondaryTextStyle.copyWith(fontSize: 20),
          ),
          TextFormField(
            style: primaryTextStyle.copyWith(fontSize: 20),
            decoration: InputDecoration(
                hintText: 'auau@gmail.com',
                hintStyle: secondaryTextStyle.copyWith(fontSize: 20),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor))),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: header(),
      ),
      body: content(),
    );
  }
}
