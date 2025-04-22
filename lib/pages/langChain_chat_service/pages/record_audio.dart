import 'package:eduguide/pages/langChain_chat_service/services/langchain_service.dart';
import 'package:eduguide/pages/langChain_chat_service/services/speak_words.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:lottie/lottie.dart';

class RecordAudio extends StatefulWidget {
  const RecordAudio({super.key});

  @override
  State<RecordAudio> createState() => _RecordAudioState();
}

class _RecordAudioState extends State<RecordAudio> {
  SpeechToText speechToText = SpeechToText();
  String text = "Hold the button to start speaking";
  bool isListening = false;
  bool isProcessing = false;

  void startListening() async {
    bool available = await speechToText.initialize();
    if (available) {
      setState(() {
        isListening = true;
        isProcessing = false;
      });
      speechToText.listen(
        onResult: (result) {
          setState(() {
            text = result.recognizedWords;
          });
        },
      );
    }
  }

  void stopListening() async {
    setState(() {
      isListening = false;
      isProcessing = true;
    });
    speechToText.stop();

    print("Passing the text to AI");
    print(text);
    String ans = await sendMessage(text);
    print("AI response received");
    await speak(ans.replaceAll("*", ""));

    setState(() {
      isProcessing = false;
    });
    print("Done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Assistant '),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actionsPadding: EdgeInsets.only(top: 20),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isListening)
                  Lottie.asset(
                    'assets/json/listening.json',
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                  )
                else if (isProcessing)
                  Image.asset(
                    'assets/json/person.gif',
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  )
                else
                  const SizedBox(height: 200),
                const SizedBox(height: 30),
                // Text(
                //   text,
                //   textAlign: TextAlign.center,
                //   style: const TextStyle(
                //     fontSize: 22,
                //     fontWeight: FontWeight.w500,
                //     fontFamily: 'Cera Pro',
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          isProcessing
              ? null
              : AvatarGlow(
                animate: isListening,
                duration: const Duration(seconds: 2),
                glowColor: const Color.fromARGB(255, 7, 181, 255),
                repeat: true,
                startDelay: const Duration(milliseconds: 100),
                child: GestureDetector(
                  onTapDown: (_) => startListening(),
                  onTapUp: (_) => stopListening(),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 40,
                    child: Icon(
                      isListening ? Icons.pause : Icons.mic,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
    );
  }
}
