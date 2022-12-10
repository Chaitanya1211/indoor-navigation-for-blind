import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';

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
  speak() async {
    List<String> array = [
      "Bedroom 1",
      "Entrance",
      "Living Room",
      "Kitchen",
      "Washroom"
    ];
    var temp = int.parse(value) - 1;
    String text = array[temp];
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak("Currently you are present in " + text);
  }

  speakString(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  position(String value) {
    List<String> array = [
      "Start Navigation",
      "Bedroom 1",
      "Entrance",
      "Living Room",
      "Kitchen",
      "Washroom"
    ];
    var temp = int.parse(value);
    return GestureDetector(
      onTap: () {
        speak();
      },
      child: Card(
          // margin: EdgeInsets.all(10),
          color: Colors.amber,
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: const Text(
                    "Currently you are present in ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    array[temp],
                    style: const TextStyle(fontSize: 25),
                  ),
                )
              ],
            ),
          )),
    );
  }

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

    destinationCard(String dest) {
      return GestureDetector(
        //Living Room
        onTap: (() {
          print(dest);
          speakString(dest + ".Double tap to confirm the destination");
        }),
        onDoubleTap: () {
          setState(() {
            destination = dest;
            speakString("Destination set to." +
                dest +
                ".Tap on the screen to start navigation");
            // speakString("Navigating you to " + dest);
            print("Destination :" + destination);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NavigatorPage(dest: destination)));
          });
        },
        child: Container(
          height: 110,
          width: 320,
          child: Card(
            color: Colors.amber,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(dest, style: TextStyle(fontSize: 30)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text("Single Tap to announce the destination"),
                  ),
                  Container(
                    child: Text("Double tap to confirm the destinaiton"),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          position(value),
          destinationCard("Entrance"),
          SizedBox(
            height: 10,
          ),
          destinationCard("Living Room"),
          SizedBox(
            height: 10,
          ),
          destinationCard("Washroom"),
          SizedBox(
            height: 10,
          ),
          destinationCard("Bedroom 1"),
          SizedBox(
            height: 10,
          ),
          destinationCard("Kitchen"),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
