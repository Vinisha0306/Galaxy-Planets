import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_planets/pages/homePage.dart';

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
      home: PlanetCustomRotation(),
    );
  }
}
