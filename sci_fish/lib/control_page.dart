import 'package:flutter/material.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {

  Card buildCard({required IconData icon, required String text}){
    return Card(
      color: Colors.cyan[700],
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 35.0,
                color: Colors.white,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.cyan[50],
                  fontSize: 20.0,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[300],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.cyan[700],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCard(icon: Icons.lightbulb, text: 'POWER'),
                    buildCard(icon: Icons.water, text: 'WATER'),
                    buildCard(icon: Icons.circle_outlined, text: 'OXYGEN'),
                    buildCard(icon: Icons.thermostat, text: 'TEMP'),
                  ],
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCard(icon: Icons.home, text: 'FISH'),
                    buildCard(icon: Icons.food_bank, text: 'FOOD'),
                    buildCard(icon: Icons.home, text: 'PH'),
                    buildCard(icon: Icons.air, text: 'AIR'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}