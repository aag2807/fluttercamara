// ignore_for_file: file_names, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors

import 'package:filters/home.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen() : super();

  @override
  _MySplashScreen createState() => _MySplashScreen();
}

class _MySplashScreen extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const HomeScreen(),
      duration: 3000,
      imageSize: 140,
      imageSrc: "images/icon.png",
      text: "pruebas para francisco",
      textType: TextType.NormalText,
      textStyle: const TextStyle(fontSize: 30.0, fontFamily: "Signatra"),
      backgroundColor: Colors.white,
    );
  }
}
