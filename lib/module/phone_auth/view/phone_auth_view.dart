import 'package:flutter/material.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Text("Start Your Journey"),
          ],
        ),
      ),
    );
  }
}
