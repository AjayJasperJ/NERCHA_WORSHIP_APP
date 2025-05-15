import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/navigation/home/home_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final colors = Constantcolors();
  final icons = Constanticons();
  final images = Constantimages();
  final widgets = HomeWidget();
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> category = ['All', 'Temple', 'Church', 'Mosque'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: displaysize.height * .02,
            bottom: displaysize.height * 0.08,
          ),
          child: Column(
            children: [
              SizedBox(height: displaysize.height * .06),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: displaysize.width * .04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: displaysize.height * .055,
                              width: displaysize.height * .055,
                              decoration: BoxDecoration(
                                color: colors.nercha_orange_1,
                                borderRadius: BorderRadius.circular(
                                  displaysize.height * .055 / 2,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(images.demo4),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: displaysize.width * .03),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Txt(
                                  'Hii, Akshika',
                                  font: Font.medium,
                                  color: colors.nercha_darkblue,
                                  size: displaysize.height * .02,
                                ),
                                Txt(
                                  'akshika@gmail.com',
                                  font: Font.medium,
                                  color: colors.nercha_orange_2,
                                  size: displaysize.height * .015,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: displaysize.height * .055,
                                width: displaysize.height * .055,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    displaysize.height * .055 / 2,
                                  ),
                                  border: Border.all(
                                    color: colors.nercha_grey,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    icons.account_setting,
                                    height: displaysize.height * .025,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: displaysize.width * .02),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: displaysize.height * .03),
                    Txt(
                      'Popular',
                      font: Font.medium,
                      color: colors.nercha_darkblue,
                      size: displaysize.height * .02,
                    ),
                  ],
                ),
              ),
              SizedBox(height: displaysize.height * .02),
              widgets.popular_scroller(),
              SizedBox(height: displaysize.height * .02),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: displaysize.width * .04,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        'Choose Category',
                        font: Font.medium,
                        color: colors.nercha_darkblue,
                        size: displaysize.height * .02,
                      ),
                      SizedBox(height: displaysize.height * .02),
                      SizedBox(
                        height: displaysize.height * .06,
                        width: displaysize.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(4, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedindex = index;
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Constantcolors().nercha_darkblue,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    displaysize.width / 4,
                                  ),
                                ),
                                elevation: 0,
                                color:
                                    selectedindex == index
                                        ? Constantcolors().nercha_darkblue
                                        : Constantcolors().nercha_white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: displaysize.height * .025,
                                    vertical: displaysize.height * .01,
                                  ),
                                  child: Txt(
                                    category[index],
                                    color:
                                        selectedindex == index
                                            ? Constantcolors().nercha_white
                                            : Constantcolors().nercha_darkblue,
                                    size: displaysize.height * .015,
                                    font: Font.medium,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: displaysize.height * .02),
                      widgets.choosed_scroller(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
