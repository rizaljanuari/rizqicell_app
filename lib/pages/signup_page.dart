import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:rizqicell/providers/auth_provider.dart';
import 'package:rizqicell/theme.dart';
import 'package:rizqicell/widgets/loading_button.dart';
// import 'package:rizqicell/widgets/loading_button.dart';

class SignUpPages extends StatefulWidget {
  const SignUpPages({Key? key}) : super(key: key);

  @override
  State<SignUpPages> createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController usernameController =
      TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Register',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    // Widget header
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'REGISTER',
              style: primaryTextStyle.copyWith(fontSize: 36, fontWeight: bold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Silahkan mendaftar terlebih dahulu',
              style: secondaryTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      );
    }

    // Widget kolom fullName
    Widget fullNameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: bgColorWhite,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Row(
                children: [
                  Image.asset(
                    'assets/icon_fullname.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan Nama Lengkap',
                          hintStyle: secondaryTextStyle),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      );
    }

    // Widget kolom username
    Widget usernameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: bgColorWhite,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Row(
                children: [
                  Image.asset(
                    'assets/icon_username.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan Username',
                          hintStyle: secondaryTextStyle),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      );
    }

    // Widget kolom email
    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat Email',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: bgColorWhite,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Row(
                children: [
                  Image.asset(
                    'assets/icon_email.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukkan Email',
                        hintStyle: secondaryTextStyle,
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      );
    }

    // Widget kolom Password
    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: bgColorWhite,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Row(
                children: [
                  Image.asset(
                    'assets/icon_password.png',
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukkan Password',
                        hintStyle: secondaryTextStyle,
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      );
    }

// Widget Signin Button
    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          child: Text(
            'REGISTER',
            style: secondaryTextStyle.copyWith(
                color: secondaryTextWhite, fontSize: 16, fontWeight: semiBold),
          ),
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
        ),
      );
    }

    // Widget Footer
    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah punya akun?',
              style: secondaryTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Login',
                style: secondaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: medium, color: secondaryColor),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColorGrey,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              fullNameInput(),
              usernameInput(),
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signUpButton(),
              const Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
