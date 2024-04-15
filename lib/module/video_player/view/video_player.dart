import 'package:flutter/material.dart';
import 'package:stack_overflow/_util/extensions.dart';
import 'package:stack_overflow/module/video_player/view/value_notifier.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  @override
  void dispose() {
    buttonClickedTimes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              buttonClickedTimes.value = buttonClickedTimes.value + 1;
              "Button Clicked: ${buttonClickedTimes.value}".logIt;
            },
            child: Text("Click"),
          ),
          ValueListenableBuilder(
              valueListenable: buttonClickedTimes,
              builder: (BuildContext context, int counterValue, Widget? child) {
                return Text("Counter:$counterValue");
              })
        ],
      ),
    );
  }
}
