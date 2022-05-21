import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';

class OxygenPage extends StatelessWidget {
  const OxygenPage({Key? key}) : super(key: key);

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
                  iconColor: colorOff,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () => print('Sensor Off'),
                  //TODO: Add OnTap functionality
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                  'Sensor is OFF',
                  style: TextStyle(
                    color: colorOff,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                flex: 1,
                child: ListTile(
                  title: const Text(
                    'ADC Raw',     //water tank status
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  subtitle: const Text(
                    '29',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 33.0,
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
              Expanded(
                flex: 1,
                child: ListTile(
                  title: const Text(
                    'ADC Voltage',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  subtitle: const Text(
                    '141V',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 33.0,
                      //TODO: edit textsize according to expanded
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
              Expanded(
                flex: 1,
                child: ListTile(
                  title: const Text(
                    'Dissolved Oxygen Level',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  subtitle: const Text(
                    '8879 µg/L',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 33.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Oxygen Level w.r.t Temprature:',
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
                        'Oxygen level Graph HERE',
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
