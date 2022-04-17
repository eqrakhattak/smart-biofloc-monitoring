import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'controller_card.dart';
import 'icon_content.dart';

const Color activeCardColor = Color(0xFF0097A7);

class ControlPage extends StatefulWidget {
  final String title;
  const ControlPage({Key? key, required this.title}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {

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
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ControllerCard(
                      bgColor: activeCardColor,
                      cardChild: IconContent(icon: Icons.lightbulb, label: 'POWER'),
                    ),
                    ControllerCard(
                      bgColor: activeCardColor,
                      cardChild: IconContent(icon: Icons.water, label: 'WATER',),
                    ),
                    ControllerCard(
                      bgColor: activeCardColor,
                      cardChild: IconContent(icon: Icons.circle_outlined, label: 'OXYGEN',),
                    ),
                    ControllerCard(
                      bgColor: activeCardColor,
                      cardChild: IconContent(icon: Icons.thermostat, label: 'TEMP',),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    ControllerCard(
                      bgColor: activeCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.fish, label: 'FISH',),
                    ),
                    ControllerCard(
                      bgColor: activeCardColor,
                      cardChild: IconContent(icon: Icons.food_bank, label: 'FOOD',),
                    ),
                    ControllerCard(
                      bgColor: activeCardColor,
                      cardChild: IconContent(icon: Icons.water_drop, label: 'PH',),
                    ),
                    ControllerCard(
                      bgColor: activeCardColor,
                      cardChild: IconContent(icon: Icons.air, label: 'AIR',),
                    ),
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



