import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';

class backbutton extends StatelessWidget {
  final dynamic title;
  final bool boarder;
  backbutton({super.key, this.title, required this.boarder});
  final colors = Constantcolors();
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
              child: Container(
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
                        boarder ? colors.nercha_darkblue : colors.nercha_white,
                  ),
                ),
              ),
            ),
            Text(title ?? ""),
            CircleAvatar(
              radius: displaysize.height * .03,
              backgroundColor: colors.nercha_white.withValues(alpha: 0),
            ),
          ],
        ),
      ],
    );
  }
}
