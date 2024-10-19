import 'dart:async';
import 'dart:convert';

import 'package:dddd_mobile/app/app.locator.dart';
import 'package:dddd_mobile/model/detected_object.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;

class GetCameraViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  String whatIsOnCamera = "Waiting for camera";
  FlutterTts flutterTts = FlutterTts();
  bool ttsSetupDone = false;
  bool loopWorks = true;
  Timer? timer;
  bool isSpeaking = false;

  Future setupTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(0.9);
  }

  void goBack() {
    stopLoop();
    _navigationService.back();
  }

  void readText() async {
    if (ttsSetupDone == false) await setupTts();
    if (!isSpeaking) {
      var result = await flutterTts.speak(whatIsOnCamera);
      isSpeaking = true;
    }
  }

  void startLoop() {
    if (timer == null) {
      loop();
    }
  }

  void setWhatIsOnCamera(String setTo) {
    if (setTo == whatIsOnCamera) return;
    whatIsOnCamera = setTo;
    readText();
    notifyListeners();
  }

  int howManyTimesNothing = 0;
  void proccessDetections(List detections) {
    if (detections.isEmpty) {
      howManyTimesNothing++;
      if (howManyTimesNothing > 10) {
        howManyTimesNothing = 0;
        setWhatIsOnCamera("I don't see anything");
      }
    } else {
      howManyTimesNothing = 0;
      List<DetectedObject> det = [];

      for (var detected in detections) {
        List<String> acceptable = ["chair", "person", "couch", "laptop"];
        DetectedObject newDetected = DetectedObject(
            name: detected["name"],
            confidence: double.parse(detected["confidence"].toString()),
            position: detected["position"],
            distance: double.parse(detected["distance"].toString()));
        if (acceptable.contains(newDetected.name)) {
          det.add(newDetected);
        }
      }

      //process it somehow

      String text = "";
      for (var dob in det) {
        String dis = "";
        if (dob.distance != 0) {
          if (dob.distance < 0.8) {
            switch (dob.distance) {
              case < 0.8:
                Haptics.vibrate(HapticsType.light);
              case < 0.6:
                Haptics.vibrate(HapticsType.medium);
              case < 0.4:
                Haptics.vibrate(HapticsType.heavy);
            }
          }
          dis = "${dob.distance} m";
        }
        text += "${dob.name} ${dob.position} $dis\n";
      }

      setWhatIsOnCamera(text);
    }
  }

  void loop() async {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      var client = http.Client();
      try {
        var response = await client.get(Uri.parse('http://10.9.141.144:8000/detections'));
        if (response.statusCode != 200) {
          setWhatIsOnCamera("Processing error.");
        } else {
          var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
          proccessDetections(decodedResponse["detections"]);
        }
      } finally {
        client.close();
      }
    });

    flutterTts.setCompletionHandler(() {
      isSpeaking = false;
      notifyListeners();
    });
  }

  void stopLoop() async {
    timer?.cancel();
  }

  @override
  void dispose() {
    stopLoop();
    super.dispose();
  }

  Future init() async {
    startLoop();
  }

  @override
  Future futureToRun() => init();
}
