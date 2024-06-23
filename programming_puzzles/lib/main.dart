import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_puzzles/screens/intro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:programming_puzzles/services/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

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