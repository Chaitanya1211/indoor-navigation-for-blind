import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'package:dijkstra/dijkstra.dart';
import 'package:indoornavigation/floors/floor1.dart';
import 'package:indoornavigation/floors/ground.dart';
import 'package:indoornavigation/navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterTts flutterTts = FlutterTts();
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  String value = "0";
  String destination = "";
  List<List> GroundFloor = [
    [00, 01],
    [01, 02],
    [02, 03],
    [02, 04]
  ];

  int source = 00;
  int dest = 04;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: FutureBuilder(
          future: _fApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //error
              return Text("Error ;)");
            } else if (snapshot.hasData) {
              //has data
              return content();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Widget content() {
    DatabaseReference _testRef =
        FirebaseDatabase.instance.ref("Devices/KshitijS");
    DatabaseReference child = _testRef.child("reading");
    child.onValue.listen(
      (event) {
        setState(() {
          value = event.snapshot.value.toString();
        });
      },
    );
    int intValue = int.parse(value);
    int floorNo = (intValue / 10).toInt();

    //   if (floorNo == 1) {
    //     //Ground Floor
    //     return Center(
    //       child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.all(8),
    //               child: Text(
    //                 "Ground Floor",
    //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    //               ),
    //             ),
    //             Card(
    //               child: Column(
    //                 children: [Text("Currently You are Present in"), Text(value)],
    //               ),
    //             )
    //           ]),
    //     );
    //   } else if (floorNo == 2) {
    //     //First Floor
    //     return Center(
    //       child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.all(8),
    //               child: Text(
    //                 "First Floor",
    //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    //               ),
    //             ),
    //             Card(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Column(
    //                   children: [
    //                     Text("Currently You are Present in"),
    //                     Text(value)
    //                   ],
    //                 ),
    //               ),
    //             )
    //           ]),
    //     );
    //   }
    //   return Text("NO floor");
    // }

    return Center(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: (floorNo == 1)
              ? Text("Ground Floor",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
              : Text("First Floor",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Ground()))
              },
              child: Container(
                height: 150,
                width: 250,
                color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                 
                  const Text("Ground Floor",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  
                ]),
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Floor1()))
              },
              child: Container(
                height: 150,
                width: 250,
                color: Colors.amber,
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                  Text("First Floor",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
                ]),
              ),
            )
          ],
        )
      ]),
    );
  }
}
