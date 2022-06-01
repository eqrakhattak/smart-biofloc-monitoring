import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';
import '../components/check_internet.dart';
import 'package:lottie/lottie.dart';

class AirPage extends StatefulWidget {
  const AirPage({Key? key}) : super(key: key);

  static const String id = 'air_page';

  @override
  State<AirPage> createState() => _AirPageState();
}

class _AirPageState extends State<AirPage> {

  final _firestore = FirebaseFirestore.instance;
  bool switchSensor = true;
  String sensorStatus = 'Pump is ON' ;
  Color statusColor = colorOn;
  String pumpStatus = '_';
  String airPressure = '_';

  void switchAir(){
    setState(() {
      if(switchSensor==true){
        switchSensor = false;
        sensorStatus = 'Pump is OFF';
        statusColor = colorOff;

        pumpStatus = '_';
        airPressure = '_';
      }else{
        switchSensor = true;
        sensorStatus = 'Pump is ON';
        statusColor = colorOn;

        pumpStatus = 'OK';
        airPressure = '800';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Flow'),
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
                      'Air Pump ON/OFF',
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
                      switchAir();
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
                  stream: _firestore.collection('air').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: textColor,
                        ),
                      );
                    }
                    final airData = snapshot.data!.docs;
                    for (var airflow in airData) {
                      final airpump = airflow.data() as Map<String, dynamic>;
                      if(airpump['status'] != null){
                        pumpStatus = airpump['status'] as String;
                      }
                      if(airpump['pressure'] != null){
                        airPressure = airpump['pressure'] as String;
                      }
                      isInternet();
                    }
                    return Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'Air Pump Status',
                              style: TextStyle(
                                color: textColor,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                pumpStatus,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: colorOn,
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
                              'Air Pressure',
                              style: TextStyle(
                                color: textColor,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '$airPressure Pa',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  // color: colorOn,
                                  fontSize: 33.0,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF10898d), width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ]
                    );
                  }
              ),
              Flexible(
                child: Lottie.asset(
                  'assets/images/fish.json',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
