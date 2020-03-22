import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testlogin/screens/authenticate/authentication.dart';
import 'package:testlogin/screens/home/home.dart';
import 'package:testlogin/models/user.dart';
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    }else {
      return Home();
    }
    
  }
}