import 'package:flutter/material.dart';
import 'package:sci_fish/pages/air_page.dart';
import 'package:sci_fish/pages/fish_page.dart';
import 'package:sci_fish/pages/food_page.dart';
import 'package:sci_fish/pages/oxygen_page.dart';
import 'package:sci_fish/pages/ph_page.dart';
import 'package:sci_fish/pages/power_page.dart';
import 'package:sci_fish/pages/temp_page.dart';
import 'package:sci_fish/pages/water_page.dart';
import 'pages/control_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        colorScheme: const ColorScheme.light().copyWith(primary: Colors.cyan[700],),   //replacement for PrimaryColor
        scaffoldBackgroundColor: Colors.cyan[300],
        splashColor: const Color(0xFF046169),
        highlightColor: const Color(0xFF10898d),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ControlPage(title: 'SciFish',),
        '/first': (context) => const PowerPage(),
        '/second': (context) => const WaterPage(),
        '/third': (context) => const OxygenPage(),
        '/forth': (context) => const TemperaturePage(),
        '/fifth': (context) => const FishPage(),
        '/sixth': (context) => const FoodPage(),
        '/seventh': (context) => const PhPage(),
        '/eighth': (context) => const AirPage(),
      },
    );
  }
}
























//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//
//         primarySwatch: Colors.cyan,
//       ),
//       home: const MyHomePage(title: 'SciFish'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
