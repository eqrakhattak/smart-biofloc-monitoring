import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';
import '../components/check_internet.dart';

class FishPage extends StatefulWidget {
  const FishPage({Key? key}) : super(key: key);

  static const String id = 'fish_page';

  @override
  State<FishPage> createState() => _FishPageState();
}

class _FishPageState extends State<FishPage> {

  final _firestore = FirebaseFirestore.instance;
  late String noOfAliveFish = '0';
  late String noOfDeadFish = '0';

  void updateNoOfFish(){
    final data = <String, String>{
      'alive': noOfAliveFish,
      'dead': noOfDeadFish
    };
    _firestore.collection('fish').doc('1011').set(data)
        .onError((e, _) => print("Error writing document: $e"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fish Life'),
      ),
      body: GestureDetector(
        //loose focus when clicked outside the text fields and hide keyboard
        onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.translucent,

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('fish').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: textColor,
                          ),
                        );
                      }
                      final fishData = snapshot.data!.docs;
                      for (var fishes in fishData) {
                        final fish = fishes.data() as Map<String, dynamic>;
                        if(fish['alive'] != null){
                          noOfAliveFish = fish['alive'] as String;
                        }
                        if(fish['dead'] != null){
                          noOfDeadFish = fish['dead'] as String;
                        }
                        isInternet();
                      }
                      return Column(
                          children: [
                            TextFormField(
                              initialValue: noOfAliveFish,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            style: const TextStyle(
                              color: textColor,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF10898d),),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Alive Fish',
                              labelStyle: const TextStyle(
                                fontSize: 22.0,
                                color: textColor,
                              ),
                            ),
                            onChanged: (value) {
                                noOfAliveFish = value;
                                updateNoOfFish();
                            },
                          ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              initialValue: noOfDeadFish,
                              keyboardType: TextInputType.number,
                              maxLength: 2,
                              style: const TextStyle(
                                color: textColor,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Dead Fish',
                                labelStyle: const TextStyle(
                                  fontSize: 22.0,
                                  color: textColor,
                                ),
                              ),
                              onChanged: (value) {
                                noOfDeadFish = value;
                                updateNoOfFish();
                              },
                            ),
                          ]
                      );
                    }
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Mortality Rate:',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: textColor,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white12,
                      child: const Center(
                        //TODO: Add graph in here
                        child: Text(
                          'The Mortality Graph HERE',
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
      ),
    );
  }
}