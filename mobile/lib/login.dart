import 'package:flutter/material.dart';


class Entrance extends StatelessWidget {
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
          title: Text("Login"),
        ),
          body: Center(child: Login(), 
        )
      ),
    );
  }
}

// Define a custom Form widget.
class Login extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final double fieldSpace = 11;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child:Column(
        children:<Widget>[
      Form(
      
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: <Widget>[
          Padding(
            padding:EdgeInsets.fromLTRB(0,0,0,fieldSpace),
            child:TextFormField(
              decoration: InputDecoration(labelText: 'Email: '),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter some text';
                }
                return null;
                },
              )
          ),
          
          Padding(
            padding:EdgeInsets.fromLTRB(0,0,0,fieldSpace),
            child:TextFormField(
              decoration: InputDecoration(labelText: 'Password: '),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter some text';
                }

                return null;
                },
              )
          ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: OutlineButton(
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.white,
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
      ),
          )
        ]
      )
    );
  }
}
