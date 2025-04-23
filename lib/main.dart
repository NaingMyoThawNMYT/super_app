import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_app/my_theme.dart';

String flavor = '';
MyTheme? myTheme;

void main() {
  runZonedGuarded(
    () async {
      runApp(const MyApp());
    },
    (Object error, StackTrace stack) {
      print(stack.toString());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myTheme?.primaryColor ??
            Theme.of(context).colorScheme.inversePrimary,
        title: Text(flavor),
      ),
    );
  }

  Future<void> _init() async {
    flavor = String.fromEnvironment('flavor', defaultValue: 'appa');

    print('flavor: $flavor');

    final String jsonString =
        await rootBundle.loadString('asset/theme/theme_$flavor.json');

    myTheme = MyTheme.fromJson(jsonDecode(jsonString));

    setState(() {});
  }
}

// Utils

Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
