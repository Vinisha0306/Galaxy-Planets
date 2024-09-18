import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_planets/modal/planet_modal.dart';


class PlanetController extends ChangeNotifier {
  List<Planet> allData = [];

  PlanetController() {
    loadJSON();
  }

  Future<void> loadJSON() async {
    String data = await rootBundle.loadString("assets/json/planet.json");

    List list = jsonDecode(data);
    allData = list
        .map(
          (e) => Planet.fromJson(e),
    )
        .toList();
    notifyListeners();
  }
}
