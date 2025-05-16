import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/auth/auth_screen.dart';
import 'package:nercha_worship_app/screens/onboarding/onboarding_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final images = Constantimages();
  final widgets = OnboardingWidget();
  final colors = Constantcolors();
  final _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheOnboardingImages();
    });
  }

  void _precacheOnboardingImages() {
    for (var data in widgets.Onboarding_data) {
      final imagePath = data['image'];
      precacheImage(AssetImage(imagePath), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: widgets.Onboarding_data.length,
        controller: _controller,
        itemBuilder:
            (context, index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widgets.Onboarding_data[index]['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: displaysize.height * .1,
                    width: displaysize.width * .9,
                    child: Center(
                      child: Txt(
                        widgets.Onboarding_data[index]['title'],
                        size: displaysize.height * .035,
                        align: TextAlign.center,
                        font: Font.semiBold,
                        color: colors.nercha_white,
                      ),
                    ),
                  ),
                  SizedBox(height: displaysize.height * .025),
                  SizedBox(
                    height: displaysize.height * .06,
                    width: displaysize.width * .95,
                    child: Center(
                      child: Txt(
                        widgets.Onboarding_data[index]['subtitle'],
                        size: displaysize.height * .015,
                        align: TextAlign.center,
                        font: Font.medium,
                        color: colors.nercha_white,
                      ),
                    ),
                  ),
                  SizedBox(height: displaysize.height * .02),
                  widgets.index_indicator(index),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: displaysize.width * .04,
                      vertical: displaysize.height * .02,
                    ),
                    child:
                        !(index == 2)
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AuthScreen(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height: displaysize.height * .05,
                                    width: displaysize.height * .1,
                                    child: Center(
                                      child: Txt(
                                        'Skip',
                                        color: colors.nercha_orange_2,
                                        font: Font.medium,
                                        size: displaysize.height * .02,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: displaysize.height * .06,
                                  width: displaysize.height * .15,
                                  child: ElevatedButton(
                                    style:
                                        ButtonstyleWidget()
                                            .elevated_filled_apptheme(),
                                    onPressed: () {
                                      _controller.animateToPage(
                                        index + 1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: Txt(
                                      'Next',
                                      color: colors.nercha_white,
                                      font: Font.medium,
                                      size: displaysize.height * .02,
                                    ),
                                  ),
                                ),
                              ],
                            )
                            : SizedBox(
                              height: displaysize.height * .06,
                              width: displaysize.height,
                              child: ElevatedButton(
                                style:
                                    ButtonstyleWidget()
                                        .elevated_filled_apptheme(),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AuthScreen(),
                                    ),
                                  );
                                },
                                child: Txt(
                                  'Next',
                                  color: colors.nercha_white,
                                  font: Font.medium,
                                  size: displaysize.height * .02,
                                ),
                              ),
                            ),
                  ),
                  SizedBox(height: displaysize.height * .01),
                ],
              ),
            ),
      ),
    );
  }
}
