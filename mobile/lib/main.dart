import 'package:flutter/material.dart';

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
          body: Center(child: Register(), 
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
          FlatButton(
            color: Colors.white,
            onPressed: () {
              
            },
            child: const Text('Signup', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height:30),
          FlatButton(
            color: Colors.white,
            onPressed: () {},
            child: const Text('Login', style: TextStyle(fontSize:20))
            ),
        ],
      )
    );
  }
}


// Define a custom Form widget.
class Register extends StatefulWidget {
  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}

class RegistrationFormState extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'First Name: '),
            validator: (value) {
            if (value.isEmpty) {
              return 'Enter some text';
            }
            return null;
            },
          ),

          TextFormField(
            decoration: InputDecoration(labelText: 'Last Name: '),
            validator: (value) {
            if (value.isEmpty) {
              return 'Enter some text';
            }
            return null;
            },
          ),

          TextFormField(
            decoration: InputDecoration(labelText: 'Username: '),
            validator: (value) {
            if (value.isEmpty) {
              return 'Enter some text';
            }
            return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email: '),
            validator: (value) {
            if (value.isEmpty) {
              return 'Enter some text';
            }
            return null;
            },
          ),
          
          TextFormField(
            decoration: InputDecoration(labelText: 'Password: '),
            validator: (value) {
            if (value.isEmpty) {
              return 'Enter some text';
            }
            return null;
            },
          ),

          TextFormField(
            decoration: InputDecoration(labelText: 'Confirm Password: '),
            validator: (value) {
            if (value.isEmpty) {
              return 'Enter some text';
            }
            return null;
            },
          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
              )
            )
        ],
      )
    );
    
  }
}
