import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sci_fish/pages/air_page.dart';
import 'package:sci_fish/pages/fish_page.dart';
import 'package:sci_fish/pages/food_page.dart';
import 'package:sci_fish/pages/oxygen_page.dart';
import 'package:sci_fish/pages/ph_page.dart';
import 'package:sci_fish/pages/temp_page.dart';
import 'package:sci_fish/pages/water_page.dart';
import '../components/controller_card.dart';
import '../components/icon_content.dart';
import 'power_page.dart';
import 'package:sci_fish/constants.dart';

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
          padding: const EdgeInsets.all(7.0),
          child: Row(
            //TODO: Formatting in landscape
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          // TODO: Add color change on tap.
                          // activeCardColor = inactiveCardColor
                          Navigator.pushNamed(context, '/first');
                        },
                        child: const ControllerCard(
                          bgColor: activeCardColor,
                          cardChild: IconContent(icon: Icons.lightbulb, label: 'POWER'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/second');
                        },
                        child: const ControllerCard(
                          bgColor: activeCardColor,
                          cardChild: IconContent(icon: Icons.water, label: 'WATER',),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/third');
                        },
                        child: const ControllerCard(
                          bgColor: activeCardColor,
                          cardChild: IconContent(icon: Icons.circle_outlined, label: 'OXYGEN',),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/forth');
                        },
                        child: const ControllerCard(
                          bgColor: activeCardColor,
                          cardChild: IconContent(icon: Icons.thermostat, label: 'TEMP',),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/fifth');
                        },
                        child: const ControllerCard(
                          bgColor: activeCardColor,
                          cardChild: IconContent(icon: FontAwesomeIcons.fish, label: 'FISH',),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/sixth');
                        },
                        child: const ControllerCard(
                          bgColor: activeCardColor,
                          cardChild: IconContent(icon: Icons.food_bank, label: 'FOOD',),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/seventh');
                        },
                        child: const ControllerCard(
                          bgColor: activeCardColor,
                          cardChild: IconContent(icon: Icons.water_drop, label: 'PH',),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/eighth');
                        },
                        child: const ControllerCard(
                          bgColor: activeCardColor,
                          cardChild: IconContent(icon: Icons.air, label: 'AIR',),
                        ),
                      ),
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



