import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  
  /* 
  Root Widget
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


  String email;
  String password;
  String confirm;
  
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
                decoration: InputDecoration(labelText: 'Email: '),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  if (!value.contains('@')){
                    return "Enter a valid email address";
                  }
                  email = value;
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
                  password = value;
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
                  confirm = value;
                  if (confirm != password){
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

                  if (_formKey.currentState.validate()) {
                    
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
