import 'package:flutter/material.dart';
import 'package:testlogin/screens/authenticate/authentication.dart';
import 'package:provider/provider.dart';
import 'package:testlogin/services/auth.dart';
import 'package:testlogin/screens/wrapper.dart';
import 'package:testlogin/models/user.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home:Wrapper()
      ),
    );
  }
}
