import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_puzzles/screens/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
      builder: (context, snapshot) {
        return IntroScreen();
      }, 
      future: null,
    ), 
    );
  }
}