import 'package:flutter/material.dart';
import 'package:stack_overflow/_util/extensions.dart';
import 'package:stack_overflow/module/video_player/view/video_player_child.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  bool isVisible = false;

  @override
  void initState() {
    "Parent Init State called>>>>>>".logIt;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    "Parent didChangeDependencies called>>>>>>".logIt;

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    "Parent didUpdateWidget called>>>>>>".logIt;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    "Parent Dispose Method>>>>".logIt;
    // buttonClickedTimes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    "Parent Build method called>>>>".logIt;
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isVisible = true;
                });
                // buttonClickedTimes.value = buttonClickedTimes.value + 1;
                // "Button Clicked: ${buttonClickedTimes.value}".logIt;
              },
              child: Text("Update value"),
            ),
            CustomVideoPlayerChild(isVisible: isVisible),

            // ValueListenableBuilder(
            //   valueListenable: buttonClickedTimes,
            //   builder: (BuildContext context, int counterValue, Widget? child) {
            //     return Text("Counter:$counterValue");
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
