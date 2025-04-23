import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_app/main/main.dart';

void main() {
  runZonedGuarded(
    () async {

      await init('appb');

      runApp(const MyApp());
    },
    (Object error, StackTrace stack) {
      print(stack.toString());
    },
  );
}
