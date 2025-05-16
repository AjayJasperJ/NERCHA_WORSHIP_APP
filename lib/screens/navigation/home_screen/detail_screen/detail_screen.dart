import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/navigation/home_screen/booknow_screen/booknow_screen.dart';
import 'package:nercha_worship_app/screens/navigation/home_screen/detail_screen/detail_widget.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class DetailScreen extends StatefulWidget {
  final int index;

  const DetailScreen({super.key, required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final widgets = DetailWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: displaysize.width * .04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backbutton(
                    boarder: true,
                    title: 'Velankanni Church ${widget.index}',
                    isSuffix: true,
                    suffixiconpath: Constanticons().share,
                  ),
                  SizedBox(height: displaysize.height * .03),
                  Container(
                    width: displaysize.width,
                    color: Colors.white.withValues(alpha: 0),
                    margin: EdgeInsets.only(bottom: displaysize.height * .02),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Txt(
                                  "Velankanni Church ",
                                  color: Constantcolors().nercha_darkblue,
                                  size: displaysize.height * .02,
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
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BooknowScreen(),
                                  ),
                                );
                              },
                              style:
                                  ButtonstyleWidget()
                                      .elevated_filled_apptheme(),
                              child: Txt(
                                "Book Now ",
                                color: Constantcolors().nercha_white,
                                size: displaysize.height * .016,
                                font: Font.medium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: displaysize.height * .02),
                  Txt(
                    "Choose paster",
                    color: Constantcolors().nercha_darkblue,
                    size: displaysize.height * .02,
                    font: Font.medium,
                  ),
                  SizedBox(height: displaysize.height * .02),
                ],
              ),
            ),
            widgets.listof_people(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: displaysize.width * .04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Txt(
                    'Description',
                    color: Constantcolors().nercha_darkblue,
                    size: displaysize.height * .02,
                    font: Font.medium,
                  ),
                  SizedBox(height: displaysize.height * .02),
                  Txt(
                    """Velankanni Church, also known as the Basilica of Our Lady of Good Health, is one of the most revered Christian pilgrimage destinations in India. Located in Velankanni, Tamil Nadu, this Roman Catholic Latin Rite basilica attracts millions of devotees each year, irrespective of religion, for its reputation of miraculous healing and divine grace. The church is dedicated to Mother Mary, believed to have appeared in Velankanni during the 16th and 17th centuries.\n\nHistorical Significance\n\n- Founded: 16th CenturyElevated to Basilica: 1962 by Pope John XXIII\n- The church was built in honor of reported Marian apparitions and miraculous healings witnessed by local villagers.\n- It blends Gothic architecture with Indian elements and is often called the "Lourdes of the East."\n- The annual Feast of Our Lady of Good Health from August 29 to September 8 draws lakhs of pilgrims, especially on foot.\n\nKey Highlights\n\n- Miraculous Spring near the churchStations of the Cross and Rosary Park\n- A museum of offerings from healed devotees\n- Daily Mass in multiple languages""",
                    color: Constantcolors().nercha_darkblue,
                    size: displaysize.height * .017,
                    font: Font.regular,
                    align: TextAlign.start,
                  ),
                  SizedBox(height: displaysize.height * .04),
                  widgets.contactUs_widget([
                    '+91 6381462196',
                    'velankanni@gmail.com',
                    'Velankanni, Nagapattinam District',
                  ]),
                  SizedBox(height: displaysize.height * .04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
