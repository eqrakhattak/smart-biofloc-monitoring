import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color iconColorOn = Color(0xFF00DEB1);
const Color iconColorOff = Color(0xFFF37790);

class PowerPage extends StatelessWidget {
  const PowerPage({Key? key}) : super(key: key);
  // var borderrRadius = const BorderRadius.only(topRight: Radius.circular(32), bottomRight: Radius.circular(32));

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
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: const ListTile(
                  // leading: FlutterLogo(),
                  title: Text('Farm Power ON/OFF'),
                  trailing: Icon(Icons.power_settings_new),
                  iconColor: iconColorOff,
                  tileColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: ListTile(

                  title: const Text('CCTV ON/OFF'),
                  trailing: Icon(Icons.power_settings_new),
                  iconColor: iconColorOn,
                  // style: 'Cabin',
                  // shape: ,
                  //RoundedRectangleBorder(borderRadius: borderrRadius,),
                  tileColor: Colors.white,
                  onTap: () => print('Camara ON'),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.black12,
                    child: const Center(
                      child: Text('The CCTV Footage HERE'),
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