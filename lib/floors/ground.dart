import 'package:flutter/material.dart';
import 'package:indoornavigation/Helper/directionProvider.dart';

class Ground extends StatefulWidget {
  const Ground({super.key});

  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(8),
                child: Text("Ground Floor",
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
                                DirectionProvider(dest: "12"))))
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
                                DirectionProvider(dest: "14"))))
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
                                DirectionProvider(dest: "13"))))
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
                                DirectionProvider(dest: "15"))))
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
            context, MaterialPageRoute(builder: (context) => Ground())) , child: Text(" Go to First Floor"))
          ]),
    );
  }
}
