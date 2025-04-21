import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

class ExpertVidoeCall extends StatefulWidget {
  final Call call;

  const ExpertVidoeCall({Key? key, required this.call}) : super(key: key);

  @override
  State<ExpertVidoeCall> createState() => _ExpertVidoeCallState();
}

class _ExpertVidoeCallState extends State<ExpertVidoeCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamCallContainer(
        call: widget.call,
        callContentBuilder: (
          BuildContext context,
          Call call,
          CallState callState,
        ) {
          return StreamCallContent(
            call: call,
            callState: callState,
            callControlsBuilder: (
              BuildContext context,
              Call call,
              CallState callState,
            ) {
              final localParticipant = callState.localParticipant!;
              return StreamCallControls(
                options: [
                  CallControlOption(
                    icon: const Icon(Icons.chat_outlined),
                    onPressed: () {
                      // Open your chat window
                    },
                  ),
                  FlipCameraOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  AddReactionOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  ToggleMicrophoneOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  ToggleCameraOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  LeaveCallOption(
                    call: call,
                    onLeaveCallTap: () {
                      call.leave();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
