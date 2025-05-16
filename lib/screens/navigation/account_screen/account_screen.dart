import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/navigation/account_screen/profile_screen.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final colors = Constantcolors();
  final images = Constantimages();
  final icons = Constanticons();
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> account_setting = [
      {'icon': icons.msg_alert, 'title': 'About'},
      {'icon': icons.message, 'title': 'FAQs'},
      {'icon': icons.security, 'title': 'Privacy Policy'},
      {'icon': icons.doc, 'title': 'Terms & Conditions'},
      {'icon': icons.logout, 'title': 'Logout'},
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
        child: Column(
          children: [
            backbutton(boarder: true, centeredtitle: true, title: "Settings"),
            SizedBox(height: displaysize.height * .02),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ProfileScreen(
                            data: [
                              'Abisha A',
                              'abisha12@gmail.com',
                              '+91 6381462196',
                              '123-city, Trivandrum',
                            ],
                          ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: displaysize.height * .07,
                      backgroundImage: AssetImage(images.demo4),
                    ),
                    SizedBox(height: displaysize.height * .01),
                    SizedBox(
                      width: displaysize.width,
                      child: Center(
                        child: Txt(
                          'Abisha',
                          color: colors.nercha_darkblue,
                          font: Font.medium,
                          size: displaysize.height * .02,
                          max: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: displaysize.height * .01),
            Column(
              children: List.generate(5, (index) {
                return Column(
                  children: [
                    SizedBox(height: displaysize.height * .015),
                    Container(
                      height: displaysize.height * .08,
                      width: displaysize.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: displaysize.width * .04,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: colors.nercha_grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: displaysize.height * .025,
                                width: displaysize.height * .025,
                                child: Image.asset(
                                  account_setting[index]['icon'],
                                ),
                              ),
                              SizedBox(width: displaysize.height * .02),
                              Txt(
                                account_setting[index]['title'],
                                color: Constantcolors().nercha_darkblue,
                                size: displaysize.height * .018,
                                font: Font.medium,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: displaysize.height * .025,
                            width: displaysize.height * .025,
                            child: Image.asset(
                              icons.right_arrow,
                              color: colors.nercha_darkblue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
