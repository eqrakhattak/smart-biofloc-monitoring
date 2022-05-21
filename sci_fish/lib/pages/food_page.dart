import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  static const String id = 'food_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Material(
                color: Colors.cyan[300],
                elevation: 4,
                borderRadius: BorderRadius.circular(10),
                shadowColor: Colors.blue,
                child: ListTile(
                  title: const Text(
                    'Fish Feeder ON/OFF',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  trailing: const Icon(Icons.power_settings_new),
                  iconColor: colorOff,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () => print('Feeder Off'),
                  //TODO: Add OnTap functionality
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                  'Feeder is OFF',
                  style: TextStyle(
                    color: colorOff,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Material(
                color: Colors.cyan[300],
                elevation: 4,
                borderRadius: BorderRadius.circular(10),
                shadowColor: Colors.blue,
                child: ListTile(
                  title: const Text(
                    'Current Dose',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Material(
                color: Colors.cyan[300],
                elevation: 4,
                borderRadius: BorderRadius.circular(10),
                shadowColor: Colors.blue,
                child: ListTile(
                  title: const Text(
                    'Dose Interval',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
              const Text(
                'Food Info:',
                style: TextStyle(
                  fontSize: 17.0,
                  color: textColor,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Table(
                  border: TableBorder.symmetric(outside: BorderSide.none, inside: const BorderSide(width: 1, color: activeCardColor, style: BorderStyle.solid),),
                  children:  [
                    TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              child: const Center(child: Text('    ')),
                              height: 32,
                              width: 32,
                              color: activeCardColor,
                            ),
                          ),
                          TableCell(
                            child: Container(
                              child: const Center(child: Text('Min', style: TextStyle(fontWeight: FontWeight.bold, color: iconContentColor),),),
                              height: 32,
                              width: 32,
                              color: activeCardColor,
                            ),
                          ),
                          TableCell(
                            child: Container(
                              child: const Center(child: Text('Max', style: TextStyle(fontWeight: FontWeight.bold, color: iconContentColor),),),
                              height: 32,
                              width: 32,
                              color: activeCardColor,
                            ),
                          ),
                        ]
                    ),
                    const TableRow(
                      children: [
                        TableCell(
                          child: SizedBox(
                            child: Center(child: Text('Selector Matrix', style: TextStyle(color: textColor),),),
                            height: 32,
                            width: 32,
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            child: Center(child: Text('20', style: TextStyle(color: textColor),),),
                            height: 32,
                            width: 32,
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            child: Center(child: Text('200', style: TextStyle(color: textColor),),),
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ]
                    ),
                    const TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('Pallet Size', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('800µm', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('4mm', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ]
                    ),
                    const TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('Individual Dose', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('> 1g', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('< 100g', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ]
                    ),
                    const TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('Blower', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('5.5kW', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('7.5kW', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ]
                    ),
                    const TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('Doses By Day', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('2', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('3', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ]
                    ),
                    const TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('Number of Silos', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('1', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              child: Center(child: Text('2', style: TextStyle(color: textColor),),),
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ]
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