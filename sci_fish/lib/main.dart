import 'package:flutter/material.dart';
// import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[300],
        appBar: AppBar(
          title: const Text('SciFish'),
          backgroundColor: Colors.cyan[700],
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: ControlPage(),
          ),
        ),
      ),
    );
  }
}

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {

  Card buildCard({required IconData icon, required String text}){
    return Card(
      color: Colors.cyan[700],
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 35.0,
                color: Colors.white,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.cyan[50],
                  fontSize: 20.0,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCard(icon: Icons.lightbulb, text: 'POWER'),
              buildCard(icon: Icons.water, text: 'WATER'),
              buildCard(icon: Icons.circle_outlined, text: 'OXYGEN'),
              buildCard(icon: Icons.thermostat, text: 'TEMP'),
            ],
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCard(icon: Icons.home, text: 'FISH'),
              buildCard(icon: Icons.food_bank, text: 'FOOD'),
              buildCard(icon: Icons.home, text: 'PH'),
              buildCard(icon: Icons.air, text: 'AIR'),
            ],
          ),
        ),
      ],
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
