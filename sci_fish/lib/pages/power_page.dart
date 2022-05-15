import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color iconColorOn = Color(0xFF00DEB1);
const Color iconColorOff = Color(0xFFF37790);

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
            children: [
              const ListTile(
                tileColor: Colors.white,
                // leading: FlutterLogo(),
                title: Text('Farm Power ON/OFF'),
                trailing: Icon(Icons.power_settings_new),
                iconColor: iconColorOff,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const ListTile(
                tileColor: Colors.white,
                title: Text('CCTV ON/OFF'),
                trailing: Icon(Icons.power_settings_new),
                iconColor: iconColorOn,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.black12,
                  child: const Text('The CCTV Footage HERE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}