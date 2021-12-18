import 'package:brew_crew/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error", textDirection: TextDirection.ltr);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const MaterialApp(home: Wrapper());
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
