import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';



Future speak(message) async {
  FlutterTts tts = FlutterTts();
  await tts.speak(message);

  await tts.setSpeechRate(0.4);
  await tts.setPitch(1);
  await tts.awaitSpeakCompletion(true);
}
