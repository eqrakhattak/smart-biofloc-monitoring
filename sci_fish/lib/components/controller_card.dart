import 'package:flutter/material.dart';

class ControllerCard extends StatelessWidget {
  final Color bgColor;
  final Widget cardChild;
  const ControllerCard({required this.bgColor, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: cardChild,
        ),
      ),
      elevation: 4,
      shadowColor: Colors.blue,
    );
  }
}