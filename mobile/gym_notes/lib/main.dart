import 'package:flutter/material.dart';
import 'auth.dart';

void main() => runApp(MyApp());



// Custom Form
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


// Class to maintain state in form.
class MyCustomFormState extends State<MyCustomForm> {
  // global key to identify widget

  final _formKey = GlobalKey<FormState>();
    var auth = Auth();
    var _email = "";
    var _password = "";

 
 @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

   
    return Form(
      key: _formKey,
      child: Column(
      children: <Widget>[
        TextFormField(
          /* Validator Function*/ 
          validator: (value){
            if(value.isEmpty){
              return "Email";
            }

            _email = value;
            return null;
          },
        ),

        TextFormField(
          /* Validator Function*/ 
          validator: (value){
            if(value.isEmpty){
              return "Password";
            }

            _password = value;
            return null;
          },
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: 
            RaisedButton(
              child:
                Text("Log In"),
                onPressed:(){
                
                
                String snackContent = "";
                if(_formKey.currentState.validate()){
                  
                  
                  try{
                   /* Sign in to firebase here */
                   snackContent = "Signing in...";
                  }

                  catch(e){
                    snackContent = "Error signing in...";
                    String err = e.details;
                  }
                  Scaffold
                    .of(context)
                      .showSnackBar(
                        SnackBar(
                          content: Text(snackContent)
                        )
                    );
                }
            }
        ),  
        )



      ]
      )
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Notes',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gym Notes'),
        ),
        body: Center(


          child:
          MyCustomForm(),
        ),
      ),
    );
  }
}