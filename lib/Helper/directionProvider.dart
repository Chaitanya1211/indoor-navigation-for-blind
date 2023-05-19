import 'package:dijkstra/dijkstra.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:indoornavigation/commands/commands.dart';

class DirectionProvider extends StatefulWidget {
  final String dest;
  const DirectionProvider({super.key, required this.dest});

  @override
  State<DirectionProvider> createState() => _DirectionProviderState();
}

class _DirectionProviderState extends State<DirectionProvider> {
  Commands command = Commands();
  var source = "";
  List<List> map = [
    [11, 12],
    [12, 13],
    [12, 14],
    [14, 15],
    [11, 21],
    [21, 22],
    [22, 25],
    [25, 23],
    [25, 24]
  ];
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
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
              return nav();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Widget nav() {
    DatabaseReference _testRef =
        FirebaseDatabase.instance.ref("Devices/KshitijS");
    DatabaseReference child = _testRef.child("reading");
    child.onValue.listen(
      (event) {
        setState(() {
          source = event.snapshot.value.toString();
          // convert();
        });
      },
    );
    String target = widget.dest;

    List<dynamic> findPath(source, target) {
      int from = int.parse(source);
      int to = int.parse(target);
      print(from);
      print(to);
      var output1 = Dijkstra.findPathFromPairsList(map, from, to);
      return output1;
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(source.toString()),
            Text(target.toString()),
            ElevatedButton(
                onPressed: () {
                  List<dynamic> path =
                      findPath(source.toString(), target.toString());
                  command.navigate(path);
                },
                child: Text("Start navigation"))
          ],
        ),
      ),
    );
  }
}
