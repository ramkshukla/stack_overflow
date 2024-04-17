import 'package:flutter/material.dart';
import 'package:stack_overflow/_util/app_constant.dart';
import 'package:stack_overflow/_util/extensions.dart';
import 'package:stack_overflow/module/brewary/view/brewary_view.dart';
import 'package:stack_overflow/module/brewary/view/orient_view.dart';
import 'package:stack_overflow/module/home/view/home_view.dart';
import 'package:stack_overflow/module/home/view/method_channel.dart';
import 'package:stack_overflow/module/video_player/view/video_player.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    "Base Url: $baseUrl".logIt;
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BrewaryUI(),
                  ),
                );
              },
              child: const Text("Brewary View"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrientView(),
                  ),
                );
              },
              child: const Text("Orient View"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomVideoPlayer(),
                  ),
                );
              },
              child: const Text("Video Player"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: const Text("Home"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MethodChannelUI(),
                  ),
                );
              },
              child: const Text("Method Channel"),
            )
          ],
        ),
      ),
    );
  }
}
