import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';
import '../components/check_internet.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  static const String id = 'water_page';

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {

  final _firestore = FirebaseFirestore.instance;
  bool switchSensor = true;
  String sensorStatus = 'Sensor is ON';
  Color statusColor = colorOn;
  String waterLevelStatus = '_';
  String waterVolume = '_';
  String waterLevel = '_';

  void switchWater(){
    setState(() {
      if(switchSensor==true){
        switchSensor = false;
        sensorStatus = 'Sensor is OFF';
        statusColor = colorOff;

        waterLevelStatus = '_';
        waterVolume = '_';
        waterLevel = '_';
      }else{
        switchSensor = true;
        sensorStatus = 'Sensor is ON';
        statusColor = colorOn;

        waterLevelStatus = 'HIGH';
        waterVolume = '880';
        waterLevel = '56';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Level'),
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
                    'Water Level Sensor ON/OFF',
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
                    switchWater();
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
                height: 15.0,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('water').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: textColor,
                        ),
                      );
                    }
                    final waterData = snapshot.data!.docs;
                    for (var levels in waterData) {
                      final wlevel = levels.data() as Map<String, dynamic>;
                      waterLevelStatus = wlevel['status'] as String;
                      waterVolume = wlevel['volume'] as String;
                      waterLevel = wlevel['level'] as String;
                      isInternet();
                    }
                    return Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'Water Level Status',     //water tank status
                              style: TextStyle(
                                color: textColor,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                waterLevelStatus,
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
                              'Water Level',
                              style: TextStyle(
                                color: textColor,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '$waterLevel cm',
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
                              'Water Volume',
                              style: TextStyle(
                                color: textColor,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '$waterVolume L',
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
                        ]
                    );
                  }
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Water Level per Minute:',
                style: TextStyle(
                  fontSize: 17.0,
                  color: textColor,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white12,
                    child: const Center(
                      //TODO: Add graph in here
                      child: Text(
                        'Water level Graph HERE',
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