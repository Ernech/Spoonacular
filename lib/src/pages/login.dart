import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'authentication_service.dart.dart';



class Login extends StatefulWidget {
  final String title;
  Login({Key key, this.title}) : super(key: key);
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          RaisedButton(
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  );
            },
            child: Text("Sign in"),
          )
        ],
      ),
    );
  }
}