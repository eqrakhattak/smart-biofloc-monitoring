import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../components/check_internet.dart';

class OxygenPage extends StatefulWidget {
  const OxygenPage({Key? key}) : super(key: key);

  static const String id = 'oxygen_page';

  @override
  State<OxygenPage> createState() => _OxygenPageState();
}

class _OxygenPageState extends State<OxygenPage> {

  final _firestore = FirebaseFirestore.instance;
  bool switchSensor = true;
  String sensorStatus = 'Sensor is ON' ;
  Color statusColor = colorOn;
  String raw = '_';
  String voltage = '_';
  String doLevel = '_';

  void switchOxygen(){
    setState(() {
      if(switchSensor==true){
        switchSensor = false;
        sensorStatus = 'Sensor is OFF';
        statusColor = colorOff;

        raw = '_';
        voltage = '_';
        doLevel = '_';
      }else{
        switchSensor = true;
        sensorStatus = 'Sensor is ON';
        statusColor = colorOn;

        raw = '29';
        voltage = '141';
        doLevel = '8879';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oxygen Level'),
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
                    'Oxygen Level Sensor ON/OFF',
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
                    switchOxygen();
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
                  stream: _firestore.collection('oxygen').snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: textColor,
                        ),
                      );
                    }
                    final oxygenData = snapshot.data!.docs;
                    List<num> oxygenList = [];

                    for(var oxys in oxygenData){
                      final oxy = oxys.data() as Map<String, dynamic>;
                      if(oxy['DOlevel'] != null) {
                        doLevel = oxy['DOlevel'] as String;
                        oxygenList.add(double.parse(doLevel));
                      }
                      if(oxy['voltage'] != null) {
                        voltage = oxy['voltage'] as String;
                      }
                      if(oxy['raw'] != null) {
                        raw = oxy['raw'] as String;
                      }
                      isInternet();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: const Text(
                            'Dissolved Oxygen Level',
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '$doLevel µg/L',
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
                            'ADC Voltage',
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '$voltage V',
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
                            'ADC Raw',     //water tank status
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              raw,
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
                          'Oxygen Level w.r.t Temperature:',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(
                          height: 17.0,
                        ),
                        SfSparkLineChart(
                          data: oxygenList,
                          axisLineWidth: 0,
                          color: const Color.fromRGBO(184, 71, 189, 0.35),
                          // borderColor: const Color.fromRGBO(184, 71, 189, 1),
                          // borderWidth: 1,
                        ),
                      ],
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}