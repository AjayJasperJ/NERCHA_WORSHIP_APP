import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/navigation/home_screen/payment_screen/payment_method_screen.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';
import 'package:nercha_worship_app/widgets/txtfield_widget.dart';

class BookingScreen extends StatefulWidget {
  final int index;

  const BookingScreen({super.key, required this.index});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final icons = Constanticons();
  final colors = Constantcolors();
  final images = Constantimages();
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> booking_data = [
      {'icon': icons.event, 'hint': 'Date'},
      {'icon': icons.person, 'hint': 'Name'},
      {'icon': icons.location, 'hint': 'Address'},
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
          child: Column(
            children: [
              backbutton(boarder: true, title: 'Booking', centeredtitle: true),
              SizedBox(height: displaysize.height * .03),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: displaysize.height * .02,
                  vertical: displaysize.height * .02,
                ),
                height: displaysize.height * .2,
                width: displaysize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colors.nercha_grey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Txt(
                              'Maha Ganapathy Homam',
                              color: Constantcolors().nercha_darkblue,
                              size: displaysize.height * .018,
                              font: Font.medium,
                            ),
                            SizedBox(height: displaysize.height * .005),
                            Txt(
                              '${widget.index} Coconut',
                              color: Constantcolors().nercha_grey_1,
                              size: displaysize.height * .018,
                              font: Font.medium,
                            ),
                          ],
                        ),
                        Txt(
                          '₹ ${widget.index * 1000}/-',
                          color: Constantcolors().nercha_darkblue,
                          size: displaysize.height * .02,
                          font: Font.medium,
                        ),
                      ],
                    ),
                    Container(
                      height: displaysize.height * .075,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          displaysize.width / 4,
                        ),
                        color: colors.nercha_grey_2,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: displaysize.width * .01,
                          vertical: displaysize.height * .01,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: displaysize.height * .03,
                              backgroundImage: AssetImage(images.demo4),
                            ),
                            SizedBox(width: displaysize.width * .04),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Txt(
                                  'Poojari',
                                  color: Constantcolors().nercha_grey_1,
                                  size: displaysize.height * .016,
                                  font: Font.medium,
                                ),
                                Txt(
                                  'Sri Srinivasa Dikshithar',
                                  color: Constantcolors().nercha_darkblue,
                                  size: displaysize.height * .018,
                                  font: Font.medium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(3, (index) {
                  return Column(
                    children: [
                      SizedBox(height: displaysize.height * .03),
                      txtfield(
                        prefixIcon: Image.asset(
                          booking_data[index]['icon'],
                          color: colors.nercha_grey,
                        ),
                        hintText: booking_data[index]['hint'],
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
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
                      builder:
                          (context) => PaymentMethodScreen(index: widget.index),
                    ),
                  );
                },
                style: ButtonstyleWidget().elevated_filled_apptheme(),
                child: Txt(
                  'Proceed',
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
