import 'package:flutter/material.dart';
import 'package:stack_overflow/_util/env_config.dart';

class AppConfig extends InheritedWidget {
  final EnvConfig envConfig;
  AppConfig({super.key, required super.child, required this.envConfig});
  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
