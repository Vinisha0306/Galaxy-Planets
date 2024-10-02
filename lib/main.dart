import 'package:flutter/material.dart';
import 'package:galaxy_planets/pages/splashScreen.dart';

void main() {
  runApp(PlanetApp());
}

class PlanetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
