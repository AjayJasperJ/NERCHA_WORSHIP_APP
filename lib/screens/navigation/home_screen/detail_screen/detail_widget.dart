import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class DetailWidget {
  Widget listof_people() {
    return Container(
      height: displaysize.height * .18,
      color: Colors.white.withValues(alpha: 0),
      child: ListView.builder(
        padding: EdgeInsets.only(left: displaysize.height * .015),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: displaysize.height * .015),
            child: Column(
              children: [
                Container(
                  height: displaysize.height * .1,
                  width: displaysize.height * .1,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(displaysize.width / 4),
                    color: Constantcolors().nercha_white,
                    image: DecorationImage(
                      image: AssetImage(Constantimages().demo4),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: displaysize.height * .12,
                      child: Txt(
                        "John\nmathew",
                        color: Constantcolors().nercha_darkblue,
                        size: displaysize.height * .017,
                        font: Font.medium,
                        align: TextAlign.center,
                        max: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget contactUs_widget(List<String> data) {
    List<Map<String, dynamic>> widget_data = [
      {'icon': Constanticons().phone, 'title': 'Phone Number'},
      {'icon': Constanticons().mail, 'title': 'Email ID'},
      {'icon': Constanticons().location, 'title': 'Location'},
    ];
    return Container(
      height: displaysize.height * .3,
      width: displaysize.width,
      padding: EdgeInsets.symmetric(
        horizontal: displaysize.width * .04,
        vertical: displaysize.height * .02,
      ),
      decoration: BoxDecoration(
        color: Constantcolors().nercha_orange_3,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Txt('Contact Us'),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                3,
                (index) => Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: (displaysize.height * .025) * 2,
                          width: (displaysize.height * .025) * 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              displaysize.width / 4,
                            ),
                            border: Border.fromBorderSide(
                              BorderSide(color: Constantcolors().nercha_grey),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              widget_data[index]['icon'],
                              height: displaysize.height * .02,
                              color: Constantcolors().nercha_darkblue,
                            ),
                          ),
                        ),
                        SizedBox(width: displaysize.height * .02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              widget_data[index]['title'],
                              size: displaysize.height * .015,
                              color: Constantcolors().nercha_grey_1,
                              font: Font.medium,
                            ),
                            Txt(
                              data[index],
                              color: Constantcolors().nercha_darkblue,
                              size: displaysize.height * .017,
                              font: Font.medium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: displaysize.height * .02),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
