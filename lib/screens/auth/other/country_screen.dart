import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/auth/login/login_widget.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';
import 'package:nercha_worship_app/widgets/txtfield_widget.dart';
import 'package:nercha_worship_app/widgets/txtotpfield_widget.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
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
              'Pick your country',
              color: colors.nercha_darkblue,
              size: displaysize.height * .025,
              font: Font.semiBold,
            ),

            SizedBox(height: displaysize.height * .02),
            SizedBox(
              width: displaysize.width * .8,
              child: Txt(
                'Choose the nation where you currently live or reside.',
                color: colors.nercha_darkblue,
                size: displaysize.height * .016,
                font: Font.medium,
              ),
            ),
            SizedBox(height: displaysize.height * .04),
            txtfield(
              hintText: 'Search',
              prefixIcon: SizedBox(height: displaysize.height*.01,
                child: Image.asset(
                  icons.search,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
