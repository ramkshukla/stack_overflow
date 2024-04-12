import 'package:flutter/material.dart';
import 'package:stack_overflow/_util/app_constant.dart';
import 'package:stack_overflow/_util/extensions.dart';
import 'package:stack_overflow/module/brewary/view/brewary_view.dart';
import 'package:stack_overflow/module/brewary/view/orient_view.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
