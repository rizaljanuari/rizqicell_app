import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:rizqicell/providers/auth_provider.dart';
import 'package:rizqicell/theme.dart';
import 'package:rizqicell/widgets/loading_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Login',
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
              'LOGIN',
              style: primaryTextStyle.copyWith(fontSize: 36, fontWeight: bold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Login untuk melanjutkan',
              style: secondaryTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      );
    }

    // Widget kolom email
    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 80),
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
                      controller: emailController,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan Email',
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

    // Widget kolom password
    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
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
    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          child: Text(
            'LOGIN',
            style: secondaryTextStyle.copyWith(
                color: secondaryTextWhite, fontSize: 16, fontWeight: semiBold),
          ),
          onPressed: handleSignIn,
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
              'Belum punya akun?',
              style: secondaryTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign_up');
              },
              child: Text(
                'Register',
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
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signInButton(),
              const Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
