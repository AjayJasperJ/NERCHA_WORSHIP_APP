import 'package:flutter/material.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/navigation/account/account_screen.dart';
import 'package:nercha_worship_app/screens/navigation/event/event_screen.dart';
import 'package:nercha_worship_app/screens/navigation/home/home_screen.dart';
import 'package:nercha_worship_app/screens/navigation/search/search_screen.dart';

class NavigatorScreen extends StatefulWidget {
  static final PageController pageController = PageController();
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  final colors = Constantcolors();
  final icons = Constanticons();
  int currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    EventScreen(),
    AccountScreen(),
  ];

  void onTabTapped(int index) {
    NavigatorScreen.pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> navigatorfield_data = [
      {'icon': icons.home, 'selectedicon': icons.home_fill, 'title': 'Home'},
      {'icon': icons.search, 'selectedicon': icons.search, 'title': 'Home'},
      {'icon': icons.event, 'selectedicon': icons.event_fill, 'title': 'Home'},
      {
        'icon': icons.setting,
        'selectedicon': icons.setting_fill,
        'title': 'Home',
      },
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned.fill(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: NavigatorScreen.pageController,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                children: _pages,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: constraints.maxHeight * 0.09,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(constraints.maxWidth * 0.04),
                  ),
                  color: colors.nercha_white,
                  boxShadow: [
                    BoxShadow(color: colors.nercha_grey, blurRadius: 10),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    navigatorfield_data.length == _pages.length
                        ? _pages.length
                        : 0,
                    (index) {
                      final value = navigatorfield_data[index];
                      return Image.asset(value['selectedicon']);
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
