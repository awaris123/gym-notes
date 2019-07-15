import 'package:flutter/material.dart';
import 'package:gym_notes/register.dart';

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
          new ShowLogo(),
          _emailInput(),
          _pwInput(),
          Padding(
            padding: EdgeInsets.fromLTRB(100, 40.0, 0.0, 0.0),
            child: 
            Column(
              children: <Widget>[
                new MaterialButton(
                  elevation: 5.0,
                  minWidth: 200.0,
                  height: 42.0,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                  color: Colors.blue,
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                  if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                    Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
                },
              child: 
                Text('Login',
                      style: 
                        TextStyle(
                          color:Colors.white
                        )
                      ),
              ),
            FlatButton(
              child: 
                new Text('Create an Account',
                  style: new TextStyle(
                    fontSize: 18.0, 
                    fontWeight: FontWeight.w300
                  )
                ),
                onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registration()),
                  );
                }
              )
            ]
          )
            
            ),
        ],
        ),
      )
    ]
  )
  );
  }
}

class ShowLogo extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    var assetsImage = new AssetImage('assets/logo.png'); 
    var image = new Image(image:assetsImage, width: 48.0, height: 48.0);
    return Container(
      child:image
    );
  }
}
Widget _emailInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 200, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Email',
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null
    ),
  );
}

Widget _pwInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null
    ),
  );
}


