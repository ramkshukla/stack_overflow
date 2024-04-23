import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stack_overflow/_util/app_config.dart';
import 'package:stack_overflow/_util/env_config.dart';
import 'package:stack_overflow/main.dart';

Future<void> main() async {
  EnvConfig uatConfiguration = uat;
  AppConfig appConfig = AppConfig(child: MyApp(), envConfig: uatConfiguration);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(appConfig);
}
