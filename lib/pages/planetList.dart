import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'homePage.dart';

class PlanetListScreen extends StatefulWidget {
  @override
  _PlanetListScreenState createState() => _PlanetListScreenState();
}

List<dynamic> planets = [];

class _PlanetListScreenState extends State<PlanetListScreen> {
  @override
  void initState() {
    super.initState();
    loadPlanets();
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Planets'),
      ),
      body: planets.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: planets.length,
              itemBuilder: (context, index) {
                final planet = planets[index];
                return ListTile(
                  leading: Image.asset(planet['image']),
                  title: Text(planet['name']),
                  subtitle: Text(planet['description']),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanetCustomRotation(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
