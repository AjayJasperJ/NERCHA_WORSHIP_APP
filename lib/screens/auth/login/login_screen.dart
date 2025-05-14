import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/auth/login/login_widget.dart';
import 'package:nercha_worship_app/screens/auth/other/country_screen.dart';
import 'package:nercha_worship_app/screens/auth/other/otp_screen.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';
import 'package:nercha_worship_app/widgets/txtfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final widgets = LoginWidget();
  final phone_controller = TextEditingController();
  final icons = Constanticons();
  final colors = Constantcolors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: displaysize.width * .04,
          vertical: displaysize.height * .02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backbutton(boarder: true),
            SizedBox(height: displaysize.height * .03),
            Txt(
              'Enter your phone number',
              color: colors.nercha_darkblue,
              size: displaysize.height * .025,
              font: Font.semiBold,
            ),

            SizedBox(height: displaysize.height * .02),
            SizedBox(
              width: displaysize.width * .8,
              child: Txt(
                'Provide your phone number to log in and access your account.',
                color: colors.nercha_darkblue,
                size: displaysize.height * .016,
                font: Font.medium,
              ),
            ),
            SizedBox(height: displaysize.height * .04),
            txtfield(
              hintText: 'Phone Number',
              isPrefix: true,
              prefixIcon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CountryScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      radius: displaysize.height * .015,
                      backgroundColor: colors.nercha_orange_1,
                    ),
                    Txt('+195'),
                    SizedBox(
                      height: displaysize.height * .02,
                      child: Image.asset(icons.down_arrow),
                    ),
                  ],
                ),
              ),
              keyboardtype: TextInputType.phone,
              controller: phone_controller,
              inputformat: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: widgets.validatePhone,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: displaysize.height * .15,
        padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
        child: Column(
          children: [
            SizedBox(
              height: displaysize.height * .06,
              width: displaysize.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpScreen()),
                  );
                },
                style: ButtonstyleWidget().elevated_filled_apptheme(),
                child: Txt(
                  'Next',
                  color: colors.nercha_white,
                  font: Font.medium,
                  size: displaysize.height * .02,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          fontSize: displaysize.height * .016,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'general_sans',
                        ),
                      ),
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: displaysize.height * .016,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'general_sans',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
