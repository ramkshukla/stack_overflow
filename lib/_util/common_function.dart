import 'package:flutter/material.dart';

class OperationClass {
  final String text;
  final IconData iconData;

  OperationClass({required this.text, required this.iconData});
}

List<OperationClass> data = [
  OperationClass(text: "Send To", iconData: Icons.send),
  OperationClass(text: "Receive ", iconData: Icons.call_received),
  OperationClass(text: "Top Up", iconData: Icons.touch_app),
  OperationClass(text: "More", iconData: Icons.more),
];
