import 'package:flutter/material.dart';
import 'package:grid_game/constant/size_constant.dart';
import 'package:grid_game/constant/text_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initMethods(context);
    super.initState();
  }

  initMethods(context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, TextConstants.ADD_GRID_ROUTE);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Icon(Icons.grid_4x4, size: width(context) * 0.3),
        ),
      ),
    );
  }
}
