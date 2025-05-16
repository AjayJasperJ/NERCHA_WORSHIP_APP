import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/navigation/account_screen/edit_profile_screen.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class ProfileScreen extends StatefulWidget {
  final List<String> data;

  const ProfileScreen({super.key, required this.data});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final colors = Constantcolors();
  final images = Constantimages();
  final icons = Constanticons();
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> profile_data = [
      {'icon': icons.person, 'title': 'Name'},
      {'icon': icons.mail, 'title': 'Email ID'},
      {'icon': icons.phone, 'title': 'Phone Number'},
      {'icon': icons.location, 'title': 'Address'},
    ];
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: displaysize.height * .25,
                width: displaysize.width,
                color: colors.nercha_orange_3,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: displaysize.width * .04,
                  ),
                  child: Column(
                    children: [
                      backbutton(
                        boarder: true,
                        title: 'Profile',
                        centeredtitle: true,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: -displaysize.height * .08,
                child: Container(
                  height: displaysize.height * .16,
                  width: displaysize.height * .16,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(images.demo4)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: displaysize.height * .15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: displaysize.width * .08),
            child: Column(
              children: List.generate(4, (index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: (displaysize.height * .03) * 2,
                          width: (displaysize.height * .03) * 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              displaysize.width / 4,
                            ),
                            color: colors.nercha_orange_2,
                          ),
                          child: Center(
                            child: Image.asset(
                              profile_data[index]['icon'],
                              height: displaysize.height * .025,
                              color: colors.nercha_white,
                            ),
                          ),
                        ),
                        SizedBox(width: displaysize.height * .02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              profile_data[index]['title'] ?? '',
                              color: Constantcolors().nercha_grey_1,
                              size: displaysize.height * .016,
                              font: Font.medium,
                            ),
                            Txt(
                              widget.data[index],
                              color: Constantcolors().nercha_darkblue,
                              size: displaysize.height * .018,
                              font: Font.medium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: displaysize.height * .02),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: displaysize.height * .1,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
            child: SizedBox(
              height: displaysize.height * .06,
              width: displaysize.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  );
                },
                style: ButtonstyleWidget().elevated_filled_apptheme(),
                child: Txt(
                  'Edit',
                  color: colors.nercha_white,
                  font: Font.medium,
                  size: displaysize.height * .02,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
