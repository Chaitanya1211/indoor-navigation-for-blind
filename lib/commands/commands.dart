import 'package:flutter_tts/flutter_tts.dart';

class Commands {
  List<String> str = ["ABC", "PQR", "VWX"];
  final FlutterTts flutterTts = FlutterTts();
  speakString(String text) async {
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  navigate(List<dynamic> path) async {
    // List<dynamic> dynamicList = [1, 2, 3, '4', '5'];

    List<int> intPath = path.map((dynamic element) {
      return int.parse(element.toString());
    }).toList();

    print("Navigate called");
    // speakString("hello hi");
    print(intPath);
    var length = intPath.length;
    // for (int i = 0; i < length - 1; i++) {
    //   int j = i + 1;
    //   print(intPath[i]);
    //   print(intPath[j]);
    //   print("\n");
    //   await flutterTts.awaitSpeakCompletion(true);
    //   giveCommand(intPath[i], intPath[j]);
    // }
    // for (int i = 0; i < 3; i++) {
    //   speakString(str[i]);
    // }
    for (var o in str) {
      await speakString(o);
    }
  }

  // giveCommand(var source, var dest) async {
  //   print("Give command called");
  //   if (source == 21 && dest == 22) {
  //     await speakString("Move straight towards Living Room");
  //   } else if (source == 22 && dest == 21) {
  //     await speakString("Move straight towards the door");
  //   } else if (source == 22 && dest == 25) {
  //     await speakString("Move straight towards the Washroom");
  //   } else if (source == 25 && dest == 22) {
  //     await speakString("Move straight towards the Living room");
  //   } else if (source == 25 && dest == 23) {
  //     await speakString("Move right towards the kitchen");
  //   } else if (source == 23 && dest == 25) {
  //     await speakString("Move straight towards the washroom");
  //   } else if (source == 25 && dest == 24) {
  //     await speakString("move straight towards bedroom");
  //   } else if (source == 24 && dest == 25) {
  //     await speakString("move straight towards washroom");
  //   } //ground floor plan starting
  //   else if (source == 21 && dest == 11) {
  //     await speakString("You are currently at the stairs");
  //     await speakString("Climb the stairs upwards to rech the first floor");
  //   } else if (source == 11 && dest == 21) {
  //     await speakString("You are currently at the stairs");
  //     await speakString("Decend the stairs downward to reach the ground floor");
  //   } else if (source == 11 && dest == 12) {
  //     await speakString("Move straight towards living room");
  //   } else if (source == 12 && dest == 11) {
  //     await speakString("Move straight towards staris");
  //   } else if (source == 12 && dest == 14) {
  //     await speakString("move staright towards bedroom");
  //   } else if (source == 14 && dest == 12) {
  //     await speakString("Move straight towards living room");
  //   } else if (source == 14 && dest == 15) {
  //     await speakString("Move straight towards washroom");
  //   } else if (source == 15 && dest == 14) {
  //     await speakString("move straight towards bedroom");
  //   } else if (source == 12 && dest == 13) {
  //     await speakString("Move straight towards kitchen");
  //   } else if (source == 13 && dest == 12) {
  //     await speakString("move straight towards living room");
  //   }
  // }
}
