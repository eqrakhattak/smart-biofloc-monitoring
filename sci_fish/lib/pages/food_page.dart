import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fish'),
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
              ListTile(
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
                onTap: () => print('Feerer Off'),
                //TODO: Add OnTap functionality
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0, top: 3.0),
                child: Text(
                  'Feeder is OFF',
                  style: TextStyle(
                    color: colorOff,
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              child: const Text('Selector Matrix'),
                              height: 32,
                              width: 32,
                              color: Colors.red,
                            ),
                          ),
                          TableCell(
                            child: Container(
                              child: const Text('20'),
                              height: 32,
                              width: 32,
                              color: Colors.yellow,
                            ),
                          ),
                          TableCell(
                            child: Container(
                              child: const Text('200'),
                              height: 32,
                              width: 32,
                              color: Colors.green,
                            ),
                          ),
                        ]
                      ),
                      TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                child: const Text('Pallet Size'),
                                height: 32,
                                width: 32,
                                color: Colors.red,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                child: const Text('800'),
                                //TODO: put in micro meter
                                height: 32,
                                width: 32,
                                color: Colors.yellow,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                child: const Text('4mm'),
                                height: 32,
                                width: 32,
                                color: Colors.green,
                              ),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                child: const Text('Individual Dose'),
                                height: 32,
                                width: 32,
                                color: Colors.red,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                child: const Text('Selector Matrix'),
                                height: 32,
                                width: 32,
                                color: Colors.yellow,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.green,
                              ),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.red,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.yellow,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.green,
                              ),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.red,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.yellow,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.green,
                              ),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.red,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.yellow,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.green,
                              ),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.red,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.yellow,
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.green,
                              ),
                            ),
                          ]
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
// width: double.infinity,
// color: Colors.white12,
// child: const Center(
// //TODO: Add graph in here
// child: Text(
// 'The Temperature Graph HERE',
// style: TextStyle(
// color: textColor,
// ),
// ),
// ),
// ),