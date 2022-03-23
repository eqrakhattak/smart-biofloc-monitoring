import 'package:flutter/material.dart';
// import 'constants.dart';
void main(){
  runApp(const MyApp());
}

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
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Center(
                      child: Text('HOME'),
                    ),
                    color: Colors.cyan[700],
                    width: 120.0,
                    height: 100.0,
                    // margin: EdgeInsets.all(20.0),
                    // padding: EdgeInsets.all(30.0),
                  ),
                  Container(
                    child: const Center(
                      child: Text('HOME'),
                    ),
                    color: Colors.cyan[700],
                    width: 120.0,
                    height: 100.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Center(
                      child: Text('HOME'),
                    ),
                    color: Colors.cyan[700],
                    width: 120.0,
                    height: 100.0,
                  ),
                  Container(
                    child: const Center(
                      child: Text('HOME'),
                    ),
                    color: Colors.cyan[700],
                    width: 120.0,
                    height: 100.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Center(
                      child: Text('HOME'),
                    ),
                    color: Colors.cyan[700],
                    width: 120.0,
                    height: 100.0,
                  ),
                  Container(
                    child: const Center(
                      child: Text('HOME'),
                    ),
                    color: Colors.cyan[700],
                    width: 120.0,
                    height: 100.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Center(
                      child: Text('HOME'),
                    ),
                    color: Colors.cyan[700],
                    width: 120.0,
                    height: 100.0,
                  ),
                  Container(
                    child: const Center(
                      child: Text('HOME'),
                    ),
                    color: Colors.cyan[700],
                    width: 120.0,
                    height: 100.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
