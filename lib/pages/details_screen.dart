import 'package:flutter/material.dart';

class PlanetDetailScreen extends StatefulWidget {
  final dynamic planet;

  PlanetDetailScreen({required this.planet});

  @override
  _PlanetDetailScreenState createState() => _PlanetDetailScreenState();
}

class _PlanetDetailScreenState extends State<PlanetDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _fadeInAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.planet['name'])),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: widget.planet['id'],
              child: Image.asset(widget.planet['image']),
            ),
            FadeTransition(
              opacity: _fadeInAnimation,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(widget.planet['description'],
                    style: TextStyle(fontSize: 18)),
              ),
            ),
            ScaleTransition(
              scale: _fadeInAnimation,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Distance from Sun: ${widget.planet['name']} km'),
              ),
            ),
            // Add more planet details here...
          ],
        ),
      ),
    );
  }
}
