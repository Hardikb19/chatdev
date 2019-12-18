import 'dart:async';

import 'package:flutter/material.dart';
import './homepage.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "ChatBot",
      theme: new ThemeData(
        primaryColor: new Color(0xff000000),
        accentColor: new Color(0xff000010),
      ),
      debugShowCheckedModeBanner: false,
      home: new BotHome(),
    );
  }
}
