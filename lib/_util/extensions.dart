import 'package:flutter/foundation.dart';

extension StringExtenion on String {
  void get logIt {
    if (kDebugMode) {
      print(this);
    }
  }
}
