import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_planets/pages/planetList.dart';

import 'details_screen.dart';

class PlanetCustomRotation extends StatefulWidget {
  @override
  _PlanetCustomRotationState createState() => _PlanetCustomRotationState();
}

class _PlanetCustomRotationState extends State<PlanetCustomRotation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    loadPlanets().then(
      (value) {
        _controller = AnimationController(
          vsync: this,
          duration: Duration(seconds: 8),
        )..repeat();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> loadPlanets() async {
    final String response =
        await rootBundle.loadString('assets/json/planet.json');
    final data = await json.decode(response);
    setState(() {
      planets = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return planets.isNotEmpty
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                const Align(
                  alignment: Alignment(0, -0.9),
                  child: Text(
                    'Planets',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      for (int i = 0; i < 8; i++)
                        _buildRotatingPlanet(i, _controller, 8), // 8 planets
                    ],
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Colors.black,
          );
  }

  Widget _buildRotatingPlanet(
      int index, AnimationController controller, int totalPlanets) {
    final double angle = (2 * pi / totalPlanets + 1) *
        index; // Divide 360 degrees into equal parts
    final double radius = index == 0
        ? 110
        : index == 1
            ? 125
            : index == 2
                ? 140
                : index == 3
                    ? 155
                    : index == 4
                        ? 170
                        : index == 5
                            ? 185
                            : index == 6
                                ? 200
                                : 210;
    final double size = index == 0
        ? 40
        : index == 1
            ? 50
            : index == 2
                ? 55
                : index == 3
                    ? 50
                    : index == 4
                        ? 65
                        : index == 5
                            ? 60
                            : index == 6
                                ? 58
                                : 60;

    return Stack(
      children: [
        const Image(
          image: AssetImage(
            'assets/images/sun.png',
          ),
          width: 150,
        ),
        Positioned(
          left: 60,
          top: 70,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return GestureDetector(
                onTap: () {
                  print('data');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PlanetDetailScreen(
                        planet: planets[index],
                      ),
                    ),
                  );
                },
                child: Transform.translate(
                  offset: Offset(
                    radius *
                        cos(angle +
                            controller.value * 2 * pi), // Rotates each planet
                    radius * sin(angle + controller.value * 2 * pi),
                  ),
                  child: child,
                ),
              );
            },
            child: Hero(
              tag: planets[index]['id'],
              child: Image.asset(planets[index]['image'],
                  width: size, height: size),
            ),
          ),
        ),
      ],
    );
  }
}
