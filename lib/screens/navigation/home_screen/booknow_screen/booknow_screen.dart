import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/navigation/home_screen/booknow_screen/booking_screen.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';
import 'package:nercha_worship_app/widgets/txtfield_widget.dart';

class BooknowScreen extends StatefulWidget {
  const BooknowScreen({super.key});

  @override
  State<BooknowScreen> createState() => _BooknowScreenState();
}

class _BooknowScreenState extends State<BooknowScreen> {
  final icons = Constanticons();
  final colors = Constantcolors();
  final images = Constantimages();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
        child: Column(
          children: [
            backbutton(boarder: true, title: 'Tirupati Balaji Temple'),
            SizedBox(height: displaysize.height * .02),
            txtfield(prefixIcon: Image.asset(icons.search), hintText: 'Search'),
            SizedBox(height: displaysize.height * .02),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: displaysize.height * .02),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: displaysize.height * .02,
                        vertical: displaysize.height * .015,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: displaysize.height * .01,
                      ),
                      height: displaysize.height * .15,
                      width: displaysize.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colors.nercha_orange_3,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Txt(
                                    'Maha Ganapathy Homam',
                                    color: Constantcolors().nercha_darkblue,
                                    size: displaysize.height * .018,
                                    font: Font.medium,
                                  ),
                                  SizedBox(height: displaysize.height * .005),
                                  Txt(
                                    '$index Coconut',
                                    color: Constantcolors().nercha_grey_1,
                                    size: displaysize.height * .018,
                                    font: Font.medium,
                                  ),
                                ],
                              ),
                              Txt(
                                '₹ ${index * 1000}',
                                color: Constantcolors().nercha_darkblue,
                                size: displaysize.height * .02,
                                font: Font.medium,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: displaysize.height * .06,
                                width: displaysize.height * .06,
                                child: Image.asset(images.hindu),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              BookingScreen(index: index),
                                    ),
                                  );
                                },
                                style:
                                    ButtonstyleWidget()
                                        .elevated_filled_apptheme(),
                                child: Txt(
                                  'Book Now',
                                  color: Constantcolors().nercha_white,
                                  size: displaysize.height * .014,
                                  font: Font.medium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
