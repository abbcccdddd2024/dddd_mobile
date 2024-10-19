import 'package:dddd_mobile/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class GetCameraViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String whatIsOnCamera = "Auto vlevo, člověk vpravo";
  FlutterTts flutterTts = FlutterTts();
  bool ttsSetupDone = false;

  Future setupTts() async {
    await flutterTts.setLanguage("cs-CZ");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(0.9);
  }

  void goBack() {
    _navigationService.back();
  }

  void readText() async {
    if (ttsSetupDone == false) await setupTts();
    var result = await flutterTts.speak(whatIsOnCamera);
  }
}
