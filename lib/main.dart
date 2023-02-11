import 'package:flutter/material.dart';
import 'package:grid_game/constant/text_constant.dart';
import 'package:grid_game/screens/home_screen/add_grid_screen.dart';
import 'package:grid_game/screens/introduction_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: TextConstants.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: TextConstants.SPLASH_ROUTE,
      routes: {
        TextConstants.SPLASH_ROUTE: (context) => const SplashScreen(),
        TextConstants.ADD_GRID_ROUTE: (context) => const AddGridScreen(),
      },
    );
  }
}
