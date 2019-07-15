import 'package:flutter/material.dart';
import 'package:gym_notes/start_up.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Notes',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gym Notes"),
        ),
          body: Center(child: Login(), 
        )
      ),
    );
  }
}

