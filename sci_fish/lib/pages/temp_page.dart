import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/check_internet.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  static const String id = 'temperature_page';

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {

  final _firestore = FirebaseFirestore.instance;

  bool switchSensor = true;
  String sensorStatus = 'Sensor is ON' ;
  Color statusColor = colorOn;

  String tempC = '_';
  String tempF = '_';

  // void getTemperature() async{
  //   print('this is working');
  //   final temperatures = await _firestore.collection('temperature').get();
  //   for(var temp in temperatures.docs){
  //     print(temp.data());
  //   }
  // }

  // void temperatureStream() async{
  //   final qs = await _firestore.collection('temp').snapshots();
  //   await for(var snapshot in qs){
  //     for(var temp in snapshot.docs){
  //       print(temp.data());
  //     }
  //   }
  // }

  // tempStream() async{
  //   print('doesnt');
  //   final qs = await _firestore.collection('pH').doc();
  //   final data = qs.map((event) {
  //     for (var reading in event.docs) {
  //       print(reading.data());
  //       return reading.data();
  //     }
  //   });
  //   return data;
  // }

  void switchTemp(){
    setState(() {
      if(switchSensor==true){
        switchSensor = false;
        sensorStatus = 'Sensor is OFF';
        statusColor = colorOff;
        tempC = '_';
        tempF = '_';
      }else{
        switchSensor = true;
        sensorStatus = 'Sensor is ON';
        statusColor = colorOn;
        tempC = '33';
        tempF = '78';
      }
    });
  }

  // Future<void> init() async {
  //   final AndroidInitializationSettings initializationSettingsAndroid =
  //   AndroidInitializationSettings('app_icon');
  //
  //   final IOSInitializationSettings initializationSettingsIOS =
  //   IOSInitializationSettings(
  //     requestSoundPermission: false,
  //     requestBadgePermission: false,
  //     requestAlertPermission: false,
  //     onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  //   );
  //
  //   final InitializationSettings initializationSettings =
  //   InitializationSettings(
  //       android: initializationSettingsAndroid,
  //       iOS: initializationSettingsIOS,
  //       macOS: null);
  //
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onSelectNotification: selectNotification);
  // }
  //
  // Future selectNotification(String payload) async {
  //   //Handle notification tapped logic here
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature'),
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
                    'Temperature Sensor ON/OFF',
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
                    switchTemp();
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
                stream: _firestore.collection('temp').snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: textColor,
                      ),
                    );
                  }
                  final tempData = snapshot.data!.docs;
                  List<num> tempCList = [];
                  List<num> tempFList = [];

                  for(var temps in tempData){
                    final temp = temps.data() as Map<String, dynamic>;
                    if(temp['celcius'] != null){
                      tempC = temp['celcius'] as String;
                      tempCList.add(double.parse(tempC));
                    }
                    if(temp['fahrenheit'] != null){
                      tempF = temp['fahrenheit'] as String;
                      tempFList.add(double.parse(tempF));
                    }
                    isInternet();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: const Text(
                          'Celsius Temperature',
                          style: TextStyle(
                            color: textColor,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '$tempC °C',
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
                          'Fahrenheit Temperature',
                          style: TextStyle(
                            color: textColor,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '$tempF °F',
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
                        height: 15.0,
                      ),
                      const Text(
                        'Temperature per Second:',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SfSparkLineChart(
                        data: tempCList,
                        axisLineWidth: 0,
                        color: const Color.fromRGBO(184, 71, 189, 0.35),
                        // borderColor: const Color.fromRGBO(184, 71, 189, 1),
                        // borderWidth: 1,
                      ),
                    ]
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}