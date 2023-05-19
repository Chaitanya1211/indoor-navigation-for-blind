import 'package:flutter/material.dart';
import 'package:indoornavigation/floors/ground.dart';

import '../Helper/directionProvider.dart';

class Floor1 extends StatefulWidget {
  const Floor1({super.key});

  @override
  State<Floor1> createState() => _Floor1State();
}

class _Floor1State extends State<Floor1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(8),
                child: Text("First Floor",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                DirectionProvider(dest: "22"))))
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 250,
                      color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("Living Room",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30))
                      ]),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                DirectionProvider(dest: "24"))))
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 250,
                      color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("Bedroom",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30))
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                DirectionProvider(dest: "23"))))
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 250,
                      color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("Kitchen",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30))
                      ]),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                DirectionProvider(dest: "25"))))
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 250,
                      color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("Washroom",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30))
                      ]),
                    ),
                  ),
                ),
              ],
            )
          ,ElevatedButton(onPressed:()=>Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Ground())) , child: Text(" Go to Ground Floor"))
          ]),
    );
  }
}
