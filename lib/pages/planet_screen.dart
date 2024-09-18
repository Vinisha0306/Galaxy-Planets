import 'package:flutter/material.dart';
import 'package:galaxy_planets/controller/planet_controller.dart';
import 'package:provider/provider.dart';

import '../modal/planet_modal.dart';
import 'details_screen.dart';

class PlanetListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlanetController provider = Provider.of<PlanetController>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Galaxy Planets")),
      body: ListView.builder(
        itemCount: provider.allData.length,
        itemBuilder: (context, index) {
          final planet = provider.allData[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlanetDetailScreen(planet: planet),
                ),
              );
            },
            child: Hero(
              tag: planet.id,
              child: Card(
                child: ListTile(
                  leading: Image.asset(planet.imagePath), // Planet image
                  title: Text(planet.name),
                  subtitle: Text(planet.shortInfo),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
