import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'controller_card.dart';
import 'icon_content.dart';
import 'power_page.dart';

const Color activeCardColor = Color(0xFF0097A7);
const Color inactiveCardColor = Color(0xFF00ACC1);

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
      appBar: AppBar(
        title: Text(widget.title),
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
                  children: [
                    GestureDetector(
                      onTap: (){
                        // activeCardColor = inactiveCardColor
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PowerPage()));
                      },
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: Icons.lightbulb, label: 'POWER'),
                      ),
                    ),
                    GestureDetector(
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: Icons.water, label: 'WATER',),
                      ),
                    ),
                    GestureDetector(
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: Icons.circle_outlined, label: 'OXYGEN',),
                      ),
                    ),
                    GestureDetector(
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: Icons.thermostat, label: 'TEMP',),
                      ),
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
                  children: [
                    GestureDetector(
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: FontAwesomeIcons.fish, label: 'FISH',),
                      ),
                    ),
                    const ControllerCard(
                      bgColor: activeCardColor,
                      cardChild: IconContent(icon: Icons.food_bank, label: 'FOOD',),
                    ),
                    const ControllerCard(
                      bgColor: activeCardColor,
                      cardChild: IconContent(icon: Icons.water_drop, label: 'PH',),
                    ),
                    const ControllerCard(
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



