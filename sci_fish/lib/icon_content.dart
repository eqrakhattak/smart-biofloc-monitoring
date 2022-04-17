import 'package:flutter/material.dart';

const iconContentColor = Color(0xFFE0F7FA);
const iconSize = 35.0;
const labelTextStyle = TextStyle(
  color: iconContentColor,
  fontSize: 20.0,
  fontFamily: 'Cabin',
  fontWeight: FontWeight.bold,
  letterSpacing: 2.5,
);


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
          size: iconSize,
          color: iconContentColor,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}