import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';

class ButtonstyleWidget {
  ButtonStyle elevated_filled_apptheme() {
    return ButtonStyle(
      splashFactory: InkSplash.splashFactory,
      elevation: WidgetStatePropertyAll(0),
      backgroundColor: WidgetStatePropertyAll(Constantcolors().nercha_orange_2),
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.pressed)) {
          return Colors.white.withValues(alpha: 0.1);
        }
        return null;
      }),
    );
  }

  ButtonStyle elevated_boardered_apptheme() {
    return ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(displaysize.width / 4),
          side: BorderSide(color: Constantcolors().nercha_orange_2, width: 1.5),
        ),
      ),
      splashFactory: InkSplash.splashFactory,
      elevation: WidgetStatePropertyAll(0),
      backgroundColor: WidgetStatePropertyAll(Constantcolors().nercha_white),
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.pressed)) {
          return Constantcolors().nercha_orange_2.withValues(alpha: .2);
        } else if (states.contains(WidgetState.hovered)) {
          return Constantcolors().nercha_white.withValues(alpha: .0);
        }
        return null;
      }),
    );
  }
}
