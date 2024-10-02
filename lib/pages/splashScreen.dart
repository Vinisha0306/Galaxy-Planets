import 'package:flutter/material.dart';

import 'homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PlanetCustomRotation(),
          ),
        );
      },
    );
    Future.delayed(Duration(seconds: 1), () {
      width = 350;
      setState(() {});
    });

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bg.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 350,
          left: 40,
          child: AnimatedContainer(
            width: width,
            duration: const Duration(seconds: 3),
            child: const Image(
              image: AssetImage('assets/images/milkyWay.png'),
            ),
          ),
        ),
      ],
    );
  }
}
