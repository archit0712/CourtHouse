import 'package:courthouse/Screens/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title : Text('CourtHouse'),
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(onPressed: () async {
             await _auth.signOut();
          }
          , icon: Icon(Icons.person)
          , label: Text("LogOut"))
        ],
      ),
    );
  }
}