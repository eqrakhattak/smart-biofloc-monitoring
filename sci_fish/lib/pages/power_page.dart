import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';

class PowerPage extends StatefulWidget {
  const PowerPage({Key? key}) : super(key: key);

  static const String id = 'power_page';

  @override
  State<PowerPage> createState() => _PowerPageState();
}

class _PowerPageState extends State<PowerPage> {

  bool power = true;
  bool cam = false;
  String powerStatus = 'Power is ON';
  String camStatus = 'Camera is OFF';
  Color powerStatusColor = colorOn;
  Color camStatusColor = colorOff;

  void switchPower(){
    setState(() {
      if(power==true){
        power = false;
        powerStatus = 'Power is OFF';
        powerStatusColor = colorOff;
      }else{
        power = true;
        powerStatus = 'Power is ON';
        powerStatusColor = colorOn;
      }
    });
  }

  void switchCam(){
    setState(() {
      if(cam==true){
        cam = false;
        camStatus = 'Camera is OFF';
        camStatusColor = colorOff;
      }else{
        cam = true;
        camStatus = 'Camera is ON';
        camStatusColor = colorOn;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Power'),
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
                    'Farm Power ON/OFF',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  trailing: const Icon(Icons.power_settings_new),
                  iconColor: powerStatusColor,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    switchPower();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                  powerStatus,
                  style: TextStyle(
                    color: powerStatusColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Material(
                color: Colors.cyan[300],
                elevation: 4,
                borderRadius: BorderRadius.circular(10),
                shadowColor: Colors.blue,
                child: ListTile(
                  title: const Text(
                    'CCTV ON/OFF',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  trailing: const Icon(Icons.power_settings_new),
                  iconColor: camStatusColor,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    switchCam();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                  camStatus,
                  style: TextStyle(
                    color: camStatusColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.black12,
                    child: const Center(
                      child: Text(
                        'The CCTV Footage HERE',
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