// ignore_for_file: use_key_in_widget_constructors

import 'package:filters/plashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp() : super();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Demo Filtros',
      home: MySplashScreen(),
    );
  }
}
