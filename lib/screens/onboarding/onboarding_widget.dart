import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';

class OnboardingWidget {
  final List<Map<String, dynamic>> Onboarding_data = [
    {
      'image': Constantimages().onboarding_1,
      'title': 'Explore Temples,\nChurches & Mosques',
      'subtitle':
          'Explore nearby temples, churches, and mosques. Stay connected with your spiritual roots, anytime, anywhere.',
    },
    {
      'image': Constantimages().onboarding_2,
      'title': 'Book Rituals &\nAttend Events',
      'subtitle':
          'Reserve pooja slots, join special prayers, and never miss a spiritual event at your favorite places of worship.',
    },
    {
      'image': Constantimages().onboarding_3,
      'title': 'Your Personalized\nFaith Guide',
      'subtitle':
          'Personalize your experience, follow preferred religious centers, and receive timely updates—all in one app.',
    },
  ];

  Widget index_indicator(int _selected_onboard) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: displaysize.width * .006),
          height: displaysize.height * .006,
          width:
              index == _selected_onboard
                  ? displaysize.width * .05
                  : displaysize.height * .006,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(displaysize.width / 4),
            color:
                index == _selected_onboard
                    ? Constantcolors().nercha_orange_1
                    : Constantcolors().nercha_grey,
          ),
        );
      }),
    );
  }
}
