import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final colors = Constantcolors();
  final images = Constantimages();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: displaysize.width * .04,
          vertical: displaysize.height * .02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: displaysize.height * .02),
            SizedBox(
              height: displaysize.height * .25,
              width: displaysize.height * .25,
              child: Image.asset(images.app_logo),
            ),
            Column(
              children: [
                Txt(
                  'Welcome to Nercha!',
                  color: colors.nercha_orange_2,
                  font: Font.semiBold,
                  size: displaysize.height * .034,
                ),
                SizedBox(height: displaysize.height * .025),
                Txt(
                  'Nercha is your all-in-one spiritual guide to discover, connect, and engage',
                  color: colors.nercha_darkblue,
                  font: Font.medium,
                  size: displaysize.height * .017,
                  align: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: displaysize.height * .06,
                  width: displaysize.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonstyleWidget().elevated_filled_apptheme(),
                    child: Txt(
                      'Login',
                      color: colors.nercha_white,
                      font: Font.medium,
                      size: displaysize.height * .02,
                    ),
                  ),
                ),
                SizedBox(height: displaysize.height * .015),
                SizedBox(
                  height: displaysize.height * .06,
                  width: displaysize.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonstyleWidget().elevated_boardered_apptheme(),
                    child: Txt(
                      'Sign Up',
                      color: colors.nercha_orange_2,
                      font: Font.medium,
                      size: displaysize.height * .02,
                    ),
                  ),
                ),
                SizedBox(height: displaysize.height * .01),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Text('Or'),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: displaysize.height * .01),
                SizedBox(
                  height: displaysize.height * .06,
                  width: displaysize.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonstyleWidget().elevated_boardered_sociallogin(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: displaysize.height * .03,
                          width: displaysize.height * .03,
                          child: Image.asset(images.google_logo),
                        ),
                        SizedBox(width: displaysize.height * .01),
                        Txt(
                          'Continue with google',
                          color: colors.nercha_darkblue,
                          font: Font.medium,
                          size: displaysize.height * .018,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: displaysize.height * .015),
                SizedBox(
                  height: displaysize.height * .06,
                  width: displaysize.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonstyleWidget().elevated_boardered_sociallogin(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: displaysize.height * .03,
                          width: displaysize.height * .03,
                          child: Image.asset(images.facebook_logo),
                        ),
                        SizedBox(width: displaysize.height * .01),
                        Txt(
                          'Continue with facebook',
                          color: colors.nercha_darkblue,
                          font: Font.medium,
                          size: displaysize.height * .018,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: displaysize.height * .01),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
