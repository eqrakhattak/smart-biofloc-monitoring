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
                      child: Text(
                          'HOME',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    color: Colors.cyan[700],
                    width: 120.0,
                    height: 100.0,
                    // margin: EdgeInsets.all(20.0),
                    // padding: EdgeInsets.all(30.0),
                  ),
                  Container(
                    child: const Center(
                      child: Text(
                          'HOME',
                      style: TextStyle(
                        fontFamily: 'Cabin'
                      ),
                      ),
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
                    color: Colors.cyan[700],
                    width: 120.0,
                    height: 100.0,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                              Icons.home,
                            size: 35.0,
                            color: Colors.white,
                          ),
                          Text(
                            'HOME',
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
                  Card(
                    color: Colors.cyan[700],
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.home,
                              size: 35.0,
                              color: Colors.white,
                            ),
                            Text(
                              'HOME',
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
