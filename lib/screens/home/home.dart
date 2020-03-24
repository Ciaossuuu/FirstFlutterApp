import 'package:flutter/material.dart';
import 'package:testlogin/screens/home/settings_form.dart';
import 'package:testlogin/services/auth.dart';
import 'package:testlogin/services/services.dart';
import 'package:provider/provider.dart';
import 'package:testlogin/screens/home/brew_list.dart';
import 'package:testlogin/models/brew.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child:Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor:Colors.blue,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
          FlatButton.icon(
            onPressed: () => _showSettingsPanel(), 
            icon: Icon(Icons.settings), 
            label: Text('Settings')
          )
        ],
      ),
      body: BrewList(),
      )
    );
  }
}