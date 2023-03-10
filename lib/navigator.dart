import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NavigatorPage extends StatefulWidget {
  final String dest;
  const NavigatorPage({Key? key, required this.dest});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  String source = "0";
  String sourceConvert = "";
  final FlutterTts flutterTts = FlutterTts();
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: FutureBuilder(
        future: _fApp,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error)");
          } else if (snapshot.hasData) {
            return nav();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }

  convert() {
    if (source == "1") {
      setState(() {
        sourceConvert = "Bedroom 1";
      });
    } else if (source == "2") {
      setState(() {
        sourceConvert = "Entrance";
      });
    } else if (source == "3") {
      setState(() {
        sourceConvert = "Living room";
      });
    } else if (source == "4") {
      setState(() {
        sourceConvert == "Kitchen";
      });
    } else if (source == "5") {
      setState(() {
        sourceConvert = "Warshroom";
      });
    }
  }

  Widget nav() {
    speakString(String text) async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }

    DatabaseReference _testRef =
        FirebaseDatabase.instance.ref("Devices/KshitijS");
    DatabaseReference child = _testRef.child("reading");
    child.onValue.listen(
      (event) {
        setState(() {
          source = event.snapshot.value.toString();
          convert();
        });
      },
    );

    startNavigation() {
      if (source == "2") {
        // source entrance
        if (widget.dest == "Entrance") {
          speakString("You are already at the destination. Stop");
        } else if (widget.dest == "Living Room") {
          speakString("Move 5 steps in forward direction");
        } else if (widget.dest == "Washroom") {
          speakString(
              "Move 5 steps in forward direction. Turn Left. Move 3 steps forward. Washroom is towards your left. Reached the Washroom");
        } else if (widget.dest == "Kitchen") {
          speakString(
              "Move 5 steps in forward direction. Turn Left. Move 3 steps forward. Turn right. Move 2 steps forward. Reached Kitchen");
        } else if (widget.dest == "Bedroom 1") {
          speakString(
              "Move 5 steps in forward direction. Turn Left. Move 10 steps forward. Reached bedroom");
        }
      } else if (source == "3") {
        // source living room
        if (widget.dest == "Entrance") {
          speakString("Turn right. Take 5 steps forward");
        } else if (widget.dest == "Living Room") {
          speakString("You are already at the destination");
        } else if (widget.dest == "Washroom") {
          speakString(
              "Move 3 steps forward. Washroom is towards your left. Reached the Washroom");
        } else if (widget.dest == "Kitchen") {
          speakString(
              "Move 3 steps forward. Turn right. Move 2 steps forward. Reached Kitchen");
        } else if (widget.dest == "Bedroom 1") {
          speakString("Move 10 steps in forward direction. Reached Bedroom 1");
        }
      } else if (source == "5") {
        // source washroom
        if (widget.dest == "Entrance") {
          speakString(
              "Turn back. Take 3 steps forward. Turn right. Move 5 steps forward. reached entrance");
        } else if (widget.dest == "Living Room") {
          speakString("Turn back. Take 3 steps forward. reached living room");
        } else if (widget.dest == "Washroom") {
          speakString("You are already at the destination");
        } else if (widget.dest == "Kitchen") {
          speakString("Turn Right. Move 2 steps forward. Reached kitchen");
        } else if (widget.dest == "Bedroom 1") {
          speakString("Move 5 steps in forward direction. Reached bedroom 1");
        }
      } else if (source == "4") {
        // source kitchen
        if (widget.dest == "Entrance") {
          speakString(
              "Move 2 steps forward. turn left. move 5 steps forward. turn right. move 5 steps forward. reached entrance");
        } else if (widget.dest == "Living Room") {
          speakString(
              "Move 2 steps forward. turn left. move 5 steps forward. reached living room");
        } else if (widget.dest == "Washroom") {
          speakString("Move 2 steps forward. reached washroom");
        } else if (widget.dest == "Kitchen") {
          speakString("You are already at the destination");
        } else if (widget.dest == "Bedroom 1") {
          speakString(
              "move 2 steps forward.turn right. move 5 steps forward. Reached bedroom 1");
        }
      } else if (source == "1") {
        // source bedroom 1
        if (widget.dest == "Entrance") {
          speakString(
              "Move 10 steps forward. turn right.move 5 steps forward. reached entrance");
        } else if (widget.dest == "Living Room") {
          speakString("move 10 steps in forward. reached living room");
        } else if (widget.dest == "Washroom") {
          speakString("Move 5 step forward. reached washroom");
        } else if (widget.dest == "Kitchen") {
          speakString(
              "move 5 steps forward.turn left.move 2 steps forward. Reached kitchen");
        } else if (widget.dest == "Bedroom 1") {
          speakString("You are already at the destination");
        }
      }
    }

    var target = widget.dest;
    return Center(
      child: GestureDetector(
        onTap: () {
          convert();
          startNavigation();
        },
        child: Container(
          color: Colors.amber,
          height: 350,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    "\tFollow the instructions\n\t\t\t\t\t\tgiven Properly",
                    style: const TextStyle(fontSize: 25)),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Text("Source", style: const TextStyle(fontSize: 15)),
              ),
              Container(
                child:
                    Text(sourceConvert, style: const TextStyle(fontSize: 30)),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child:
                    Text("Destination", style: const TextStyle(fontSize: 15)),
              ),
              Container(
                child: Text(target, style: const TextStyle(fontSize: 30)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(child: Text("Tap to listen to instructions again")),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
