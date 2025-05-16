import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';
import 'package:nercha_worship_app/widgets/txtfield_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final images = Constantimages();
  final colors = Constantcolors();
  final icons = Constanticons();
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> editprofile_data = [
      {'icon': icons.person, 'title': 'Name'},
      {'icon': icons.mail, 'title': 'Email ID'},
      {'icon': icons.location, 'title': 'Address'},
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
        child: Column(
          children: [
            backbutton(
              boarder: true,
              centeredtitle: true,
              title: 'Edit Profile',
            ),
            SizedBox(height: displaysize.height * .08),
            Center(
              child: Container(
                height: displaysize.height * .2,
                width: displaysize.height * .2,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(images.demo4)),
                ),
              ),
            ),
            SizedBox(height: displaysize.height * .02),
            Column(
              children: List.generate(3, (index) {
                return Column(
                  children: [
                    SizedBox(height: displaysize.height * .025),
                    txtfield(
                      prefixIcon: Image.asset(editprofile_data[index]['icon']),
                      hintText: editprofile_data[index]['title'],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: displaysize.height * .1,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: displaysize.height * .06,
                  width: displaysize.width * .45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                    style: ButtonstyleWidget().elevated_boardered_apptheme(),
                    child: Txt(
                      'Cancel',
                      color: colors.nercha_orange_2,
                      font: Font.medium,
                      size: displaysize.height * .02,
                    ),
                  ),
                ),
                SizedBox(
                  height: displaysize.height * .06,
                  width: displaysize.width * .45,
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
                      'Update',
                      color: colors.nercha_white,
                      font: Font.medium,
                      size: displaysize.height * .02,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
