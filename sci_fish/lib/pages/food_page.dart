import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  static const String id = 'food_page';

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  // @override
  // void initState(){
  //   super.initState();
  //
  // }
  late String currentDose;
  late String doseInterval;
  bool switchFeeder = false;
  String feederStatus = 'Feeder is OFF' ;
  Color statusColor = colorOff;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Food'),
      ),
      body: GestureDetector(
        //loose focus when clicked outside the text fields and hide keyboard
        onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.translucent,

        child: SafeArea(
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
                    iconColor: statusColor,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFF10898d), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      setState(() {
                        if(switchFeeder==true){
                          switchFeeder = false;
                          feederStatus = 'Feeder is Off';
                          statusColor = colorOff;
                        }else{
                          switchFeeder = true;
                          feederStatus = 'Feeder is On';
                          statusColor = colorOn;
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                  child: Text(
                    feederStatus,
                    style: TextStyle(
                      color: statusColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextField(
                  // controller: nameController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  style: const TextStyle(
                    color: textColor,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF10898d),),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Current Dose (g)',
                    labelStyle: const TextStyle(
                      fontSize: 22.0,
                      color: textColor,
                    ),
                  ),
                  onChanged: (value) {
                    currentDose = value;
                    // print(currentDose);
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  // controller: nameController,
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  style: const TextStyle(
                    color: textColor,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF10898d),),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Dose Interval (hrs)',
                    labelStyle: const TextStyle(
                      fontSize: 22.0,
                      color: textColor,
                    ),
                  ),
                  onChanged: (value) {
                    doseInterval = value;
                    // print(doseInterval);
                  },
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
      ),
    );
  }
}