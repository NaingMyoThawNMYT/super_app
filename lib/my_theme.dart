import 'dart:ui';

import 'package:super_app/main.dart';

class MyTheme {
  final Color primaryColor;
  final Color secondaryColor;

  MyTheme({
    required this.primaryColor,
    required this.secondaryColor,
  });

  factory MyTheme.fromJson(Map<String, dynamic> json) => MyTheme(
        primaryColor: hexToColor(json['primaryColor']),
        secondaryColor: hexToColor(json['secondaryColor']),
      );
}
