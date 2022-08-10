import 'package:flutter/material.dart';
import 'package:rizqicell/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'L o a d i n g . . .',
              style: secondaryTextStyle.copyWith(
                  color: secondaryTextWhite,
                  fontSize: 16,
                  fontWeight: semiBold),
            ),
          ],
        ),
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
