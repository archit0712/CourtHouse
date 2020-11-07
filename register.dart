import 'package:courthouse/Screens/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        title: Text('Sign Up to CourtHouse'),
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Sign In"))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter Your Full Name',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter Your Email Here to Register',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                    validator: (val) => val.isEmpty ? 'Enter Email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter Your Password Here to register',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                  validator: (val) => val.length < 6
                      ? 'Enter password 6+ character long'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.grey[400],
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic result = await auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() =>
                            error = 'Please provide a valid Email/Password');
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0))
              ],
            ),
          )),
    );
  }
}
