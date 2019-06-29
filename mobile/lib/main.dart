import 'package:flutter/material.dart';
import 'package:gym_notes/login.dart';
import 'register.dart';

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
          body: Center(child: StartUp(), 
        )
      ),
    );
  }
}

class StartUp extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 30),
          OutlineButton(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Registration()),
                );
            },
            child: const Text('Sign Up', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height:30),
          OutlineButton(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Entrance()),
                );
            },
            child: const Text('Login', style: TextStyle(fontSize:20))
            ),
        ],
      )
    );
  }
}