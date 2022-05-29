import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';
import '../components/check_internet.dart';

class PhPage extends StatefulWidget {
  const PhPage({Key? key}) : super(key: key);

  static const String id = 'pH_page';

  @override
  State<PhPage> createState() => _PhPageState();
}

class _PhPageState extends State<PhPage> {

  final _firestore = FirebaseFirestore.instance;
  bool switchSensor = true;
  String sensorStatus = 'Sensor is ON' ;
  Color statusColor = colorOn;
  String potPinValue = '_';
  String pH = '_';

  void switchPh(){
    setState(() {
      if(switchSensor==true){
        switchSensor = false;
        sensorStatus = 'Sensor is OFF';
        statusColor = colorOff;
        potPinValue = '_';
        pH = '_';
      }else{
        switchSensor = true;
        sensorStatus = 'Sensor is ON';
        statusColor = colorOn;
        potPinValue = '278.00';
        pH = '0.74';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pH'),
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
                      'pH Sensor ON/OFF',
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
                      switchPh();
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                  sensorStatus,
                  style: TextStyle(
                    color: statusColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('pH').snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: textColor,
                      ),
                    );
                  }
                  final phData = snapshot.data!.docs;
                  for(var phs in phData){
                    final ph = phs.data() as Map<String, dynamic>;
                    if(ph['potpin'] != null){
                      potPinValue = ph['potpin'] as String;
                    }
                    if(ph['phvalue'] != null){
                      pH = ph['phvalue'] as String;
                    }
                    isInternet();
                  }
                  return Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'pH',
                          style: TextStyle(
                            color: textColor,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            pH,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 33.0,
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF10898d), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ListTile(
                        title: const Text(
                          'Pot Pin Value',
                          style: TextStyle(
                            color: textColor,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            potPinValue,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 33.0,
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF10898d), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  );
                }
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'pH per Second:',
                style: TextStyle(
                  fontSize: 17.0,
                  color: textColor,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white12,
                    child: const Center(
                      //TODO: Add graph in here
                      child: Text(
                        'pH Graph HERE',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ),
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