import 'package:flutter/material.dart';


class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconContent({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 35.0,
          color: const Color(0xFFE0F7FA),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFE0F7FA),
            fontSize: 20.0,
            fontFamily: 'Cabin',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
      ],
    );
  }
}