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
            //TODO: Formatting in landscape
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        // TODO: Add color change on tap.
                        // activeCardColor = inactiveCardColor
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PowerPage()));
                      },
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: Icons.lightbulb, label: 'POWER'),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WaterPage()));
                      },
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: Icons.water, label: 'WATER',),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OxygenPage()));
                      },
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: Icons.circle_outlined, label: 'OXYGEN',),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TemperaturePage()));
                      },
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
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const FishPage()));
                      },
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: FontAwesomeIcons.fish, label: 'FISH',),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const FoodPage()));
                      },
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: Icons.food_bank, label: 'FOOD',),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PhPage()));
                      },
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: Icons.water_drop, label: 'PH',),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AirPage()));
                      },
                      child: const ControllerCard(
                        bgColor: activeCardColor,
                        cardChild: IconContent(icon: Icons.air, label: 'AIR',),
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



