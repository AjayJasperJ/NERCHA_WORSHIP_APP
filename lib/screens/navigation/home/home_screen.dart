import 'package:flutter/material.dart';
import 'package:nercha_worship_app/app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: apptheme_light_background);
  }
}
