import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  
  /* Root Widget
  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Notes',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Create an Account"),
        ),
          body: Center(child: Register(), 
        )
      ),
    );
  }
}


/*
Widget that return registration widget
*/
class Register extends StatefulWidget {
  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}


/*
Form state for registration
*/
class RegistrationFormState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  final double fieldSpace = 11;
  String pass;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child:Column(
        children:<Widget>[
        Form(
      
          key: _formKey,
          child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: <Widget>[
            Padding(
              padding:EdgeInsets.fromLTRB(0,0,0,fieldSpace),
              child:TextFormField(
              decoration: InputDecoration(labelText: 'First Name: '),
              validator: (value) {
                
                if (value.isEmpty) {
                  return 'Enter some text';
                }
                if (value.length > 45){
                  return 'Please enter a name less than 45 characters';
                }
                return null;
                },
              )
            ),


            Padding(
              padding:EdgeInsets.fromLTRB(0,0,0,fieldSpace),
              child:TextFormField(
                decoration: InputDecoration(labelText: 'Last Name: '),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  if (value.length > 45){
                    return 'Please enter a name less than 45 characters';
                  }
                  return null;
                },
              )
            ),

            Padding(
              padding:EdgeInsets.fromLTRB(0,0,0,fieldSpace),
              child:TextFormField(
                decoration: InputDecoration(labelText: 'Username: '),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  if (value.length > 20){
                    return "Please enter a username less than 20 characters";
                  }
                  return null;
                  },
              )
            ),
          
            Padding(
              padding:EdgeInsets.fromLTRB(0,0,0,fieldSpace),
              child:TextFormField(
                decoration: InputDecoration(labelText: 'Email: '),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  if (!value.contains('@')){
                    return "Enter a valid email address";
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
                  pass = value;
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
                decoration: InputDecoration(labelText: 'Confirm Password: '),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  if (value != pass){
                    return "Your passwords do not match";
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
                      .showSnackBar(SnackBar(content: Text('Account Created!')));
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
