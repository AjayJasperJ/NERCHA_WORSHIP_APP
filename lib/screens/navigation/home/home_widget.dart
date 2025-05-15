import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class HomeWidget {
  Widget popular_scroller() {
    return SizedBox(
      height: displaysize.height * .22,
      width: displaysize.height,
      child: ListView.builder(
        padding: EdgeInsets.only(left: displaysize.height * .02),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: displaysize.height * .02),
            width: displaysize.height * .19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Constantcolors().nercha_orange_1,
              image: DecorationImage(
                image: AssetImage(Constantimages().demo1),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Txt(
                    'Somnath Temple',
                    color: Constantcolors().nercha_white,
                    size: displaysize.height * .016,
                    font: Font.medium,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: displaysize.height * .015,
                        child: Image.asset(
                          Constanticons().location,
                          color: Constantcolors().nercha_white,
                        ),
                      ),
                      SizedBox(width: displaysize.height * .005),
                      Txt(
                        'Uttar Pradesh',
                        color: Constantcolors().nercha_white,
                        size: displaysize.height * .013,
                        font: Font.medium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget choosed_scroller(context) {
    return MediaQuery.removePadding(
      context: context,
      removeLeft: true,
      removeRight: true,
      removeTop: true,
      removeBottom: true,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            height: displaysize.height * .4,
            width: displaysize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: displaysize.height * .3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(Constantimages().demo2),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: displaysize.height * .02),
                Txt(
                  "Velankanni Church ",
                  color: Constantcolors().nercha_darkblue,
                  size: displaysize.height * .018,
                  font: Font.medium,
                ),
                SizedBox(height: displaysize.height * .01),
                Row(
                  children: [
                    SizedBox(
                      height: displaysize.height * .018,
                      width: displaysize.height * .018,
                      child: Image.asset(
                        Constanticons().location,
                        color: Constantcolors().nercha_grey,
                      ),
                    ),
                    SizedBox(width: displaysize.width * .01),
                    Txt(
                      "Tamil Nadu ",
                      color: Constantcolors().nercha_grey,
                      size: displaysize.height * .016,
                      font: Font.medium,
                    ),
                  ],
                ),
                SizedBox(height: displaysize.height * .02),
              ],
            ),
          );
        },
      ),
    );
  }
}
