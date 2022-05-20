import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';

// Color(0xFF00DEB1)
// Color(0xFFF37790)
class PowerPage extends StatelessWidget {
  const PowerPage({Key? key}) : super(key: key);

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
                  iconColor: colorOn,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () => print('Power ON'),
                  //TODO: Add OnTap functionality
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                    'Power is ON',
                  style: TextStyle(
                    color: colorOn,
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
                  iconColor: colorOff,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () => print('Camara Off'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                    'Camera is OFF',
                  style: TextStyle(
                    color: colorOff,
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