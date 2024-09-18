import 'package:flutter/material.dart';

import '../modal/planet_modal.dart';

class FavoriteButton extends StatefulWidget {
  final Planet planet;

  FavoriteButton({required this.planet});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with TickerProviderStateMixin {
  bool isFavorite = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      isFavorite ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 1.5).animate(_controller),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.grey,
        ),
      ),
      onPressed: _toggleFavorite,
    );
  }
}
