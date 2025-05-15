import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';
import 'package:nercha_worship_app/widgets/txtfield_widget.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
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
            SizedBox(height: displaysize.height * .02),
            txtfield(
              hintText: 'Search',
              prefixIcon: Image.asset(icons.search, color: colors.nercha_grey),
            ),
            SizedBox(height: displaysize.height * .02),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeLeft: true,
                removeRight: true,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder:
                      (context, index) => Container(
                        height: displaysize.height * .075,
                        margin: EdgeInsets.only(
                          bottom: displaysize.height * .02,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: displaysize.height * .02,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.nercha_grey),
                          borderRadius: BorderRadius.circular(
                            displaysize.width / 4,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: displaysize.height * .015,
                                  backgroundColor: colors.nercha_orange_1,
                                ),
                                SizedBox(width: displaysize.height * .02),
                                Txt(
                                  "country name",
                                  color: colors.nercha_darkblue,
                                  size: displaysize.height * .018,
                                  font: Font.medium,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: displaysize.height * .025,
                              width: displaysize.height * .025,
                              child: Image.asset(
                                icons.unselect,
                                color: colors.nercha_grey,
                              ),
                            ),
                          ],
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
