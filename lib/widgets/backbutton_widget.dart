import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class backbutton extends StatelessWidget {
  final dynamic title;
  final bool boarder;
  final bool? centeredtitle;
  final bool? isSuffix;
  final String? suffixiconpath;

  final colors = Constantcolors();

  backbutton({
    super.key,
    required this.boarder,
    this.title,
    this.centeredtitle,
    this.isSuffix,
    this.suffixiconpath,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: displaysize.height * .06),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  centeredtitle ?? false
                      ? Container(
                        height: (displaysize.height * .03) * 2,
                        width: (displaysize.height * .03) * 2,
                        decoration:
                            boarder
                                ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    displaysize.width / 4,
                                  ),
                                  border: Border.fromBorderSide(
                                    BorderSide(color: colors.nercha_grey),
                                  ),
                                )
                                : BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    displaysize.width / 4,
                                  ),
                                  color: colors.nercha_white,
                                ),
                        child: Center(
                          child: Image.asset(
                            Constanticons().left_arrow,
                            height: displaysize.height * .03,
                            color:
                                boarder
                                    ? colors.nercha_darkblue
                                    : colors.nercha_white,
                          ),
                        ),
                      )
                      : Row(
                        children: [
                          Container(
                            height: (displaysize.height * .03) * 2,
                            width: (displaysize.height * .03) * 2,
                            decoration:
                                boarder
                                    ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        displaysize.width / 4,
                                      ),
                                      border: Border.fromBorderSide(
                                        BorderSide(color: colors.nercha_grey),
                                      ),
                                    )
                                    : BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        displaysize.width / 4,
                                      ),
                                      color: colors.nercha_white,
                                    ),
                            child: Center(
                              child: Image.asset(
                                Constanticons().left_arrow,
                                height: displaysize.height * .03,
                                color:
                                    boarder
                                        ? colors.nercha_darkblue
                                        : colors.nercha_white,
                              ),
                            ),
                          ),
                          SizedBox(width: displaysize.height * .02),
                          Txt(
                            title ?? '',
                            color: colors.nercha_darkblue,
                            size: displaysize.height * .02,
                            font: Font.medium,
                          ),
                        ],
                      ),
            ),
            centeredtitle ?? false
                ? Txt(
                  title ?? '',
                  color: colors.nercha_darkblue,
                  size: displaysize.height * .02,
                  font: Font.medium,
                )
                : SizedBox.shrink(),
            isSuffix ?? false
                ? Container(
                  height: (displaysize.height * .03) * 2,
                  width: (displaysize.height * .03) * 2,
                  decoration:
                      boarder
                          ? BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              displaysize.width / 4,
                            ),
                            border: Border.fromBorderSide(
                              BorderSide(color: colors.nercha_grey),
                            ),
                          )
                          : BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              displaysize.width / 4,
                            ),
                            color: colors.nercha_white,
                          ),
                  child: Center(
                    child: Image.asset(
                      suffixiconpath ?? '',
                      height: displaysize.height * .025,
                      color:
                          boarder
                              ? colors.nercha_darkblue
                              : colors.nercha_white,
                    ),
                  ),
                )
                : CircleAvatar(
                  radius: displaysize.height * .03,
                  backgroundColor: colors.nercha_white.withValues(alpha: 0),
                ),
          ],
        ),
      ],
    );
  }
}
