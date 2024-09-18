import 'package:flutter/material.dart';
import 'package:galaxy_planets/main.dart';

class ThemeSwitcher extends StatefulWidget {
  @override
  _ThemeSwitcherState createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isDarkTheme,
      onChanged: (value) {
        setState(() {
          isDarkTheme = value;
          // MyApp.of(context)
          //     .changeTheme(isDarkTheme ? ThemeData.dark() : ThemeData.light());
        });
      },
    );
  }
}
