import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/auth/login/login_widget.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';
import 'package:nercha_worship_app/widgets/txtotpfield_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
              'Verification code',
              color: colors.nercha_darkblue,
              size: displaysize.height * .025,
              font: Font.semiBold,
            ),

            SizedBox(height: displaysize.height * .02),
            SizedBox(
              width: displaysize.width * .8,
              child: Txt(
                'Please type your verification code send to +911234567890',
                color: colors.nercha_darkblue,
                size: displaysize.height * .016,
                font: Font.medium,
              ),
            ),
            SizedBox(height: displaysize.height * .04),
            txtotpfield(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: displaysize.height * .15,
        padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
        child: Column(
          children: [
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don’t receive the code? ",
                      style: TextStyle(
                        fontSize: displaysize.height * .016,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'general_sans',
                      ),
                    ),
                    TextSpan(
                      text: "Resend",
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

            Expanded(
              child: Center(
                child: SizedBox(
                  height: displaysize.height * .06,
                  width: displaysize.width,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => OtpScreen()),
                      // );
                    },
                    style: ButtonstyleWidget().elevated_filled_apptheme(),
                    child: Txt(
                      'Verify',
                      color: colors.nercha_white,
                      font: Font.medium,
                      size: displaysize.height * .02,
                    ),
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
