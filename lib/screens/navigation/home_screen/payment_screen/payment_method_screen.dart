import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class PaymentMethodScreen extends StatefulWidget {
  final int index;

  const PaymentMethodScreen({super.key, required this.index});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final icons = Constanticons();
  final colors = Constantcolors();
  final images = Constantimages();

  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> paymentdata_method = [
      {'icon': icons.upi, 'hint': 'UPI'},
      {'icon': icons.creditcard, 'hint': 'Credit/Debit Card'},
      {'icon': icons.bank, 'hint': 'Net Banking'},
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: displaysize.width * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backbutton(
              boarder: true,
              title: 'Payment Methods',
              centeredtitle: true,
            ),
            SizedBox(height: displaysize.height * .03),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: displaysize.height * .02,
                vertical: displaysize.height * .02,
              ),
              height: displaysize.height * .25,
              width: displaysize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: colors.nercha_grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Txt(
                    '12/12/2025',
                    color: Constantcolors().nercha_darkblue,
                    size: displaysize.height * .02,
                    font: Font.semiBold,
                  ),
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
            SizedBox(height: displaysize.height * .03),
            Txt(
              'Payment Methods',
              color: Constantcolors().nercha_darkblue,
              size: displaysize.height * .025,
              font: Font.medium,
            ),
            SizedBox(height: displaysize.height * .02),
            Column(
              children: List.generate(3, (index) {
                return Column(
                  children: [
                    SizedBox(height: displaysize.height * .015),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentindex = index;
                        });
                      },
                      child: Container(
                        height: displaysize.height * .11,
                        width: displaysize.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: displaysize.width * .04,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              index == currentindex
                                  ? colors.nercha_orange_3
                                  : colors.nercha_white,
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
                                    paymentdata_method[index]['icon'],
                                  ),
                                ),
                                SizedBox(width: displaysize.height * .02),
                                Txt(
                                  paymentdata_method[index]['hint'],
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
                                currentindex == index
                                    ? icons.selected
                                    : icons.unselect,
                                color:
                                    currentindex == index
                                        ? colors.nercha_orange_2
                                        : colors.nercha_grey,
                              ),
                            ),
                          ],
                        ),
                      ),
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
            child: SizedBox(
              height: displaysize.height * .06,
              width: displaysize.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonstyleWidget().elevated_filled_apptheme(),
                child: Txt(
                  'Pay ${widget.index * 1000}/-',
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
