import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/src/widgets/custome_input.dart';
import 'package:spoonacular/src/widgets/line_circule_detail.dart';

import '../../constants.dart';
import 'login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Registro extends StatefulWidget {
  final String title = 'Registro';
  State<StatefulWidget> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _success;
  String _userEmail;
//DIseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              new Container(
                child: new Image.asset(
                  'images/logo.png',
                  height: 160.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Registrate en Nutrana",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "Pacifico",
                  color: Color(0xFF5B8C2A),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //CustomeInput("Usuario", Icons.person, "Nombre de Usuario"),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Ingrese el email';
                  }
                },
              ),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Ingrese la contraseña';
                  }
                },
              ),
              FlatButton(
                child: Text('Register'),
                color: Colors.grey,
                textColor: Colors.white,
                onPressed: () {
                  _register();
                },
              ),
              Container(
                alignment: Alignment.center,
                child: Text(_success == null
                    ? ''
                    : (_success
                        ? 'Successfully registred' + _userEmail
                        : 'Registration Failed')),
              ),

              SizedBox(
                height: 20,
              ),
              //CustomeInput("Contraseña", Icons.lock, "Contraseña"),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                textColor: Colors.white,
                padding: EdgeInsets.all(0.0),
                shape: StadiumBorder(),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: primaryGreenLight),
                  child: Text(
                    'CREAR CUENTA',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
                ),
                onPressed: () {
                  print('clicked');
                },
              ),
              SizedBox(
                height: 40,
              ),
              LineCirculeDetail(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ya tienes cuenta? ",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Muli",
                      color: primaryBlack,
                    ),
                  ),
                  GestureDetector(
                      child: Text(
                        "Ingresa por aqui",
                        style: TextStyle(
                          color: primaryGreen,
                          fontSize: 14,
                          fontFamily: "Muli",
                        ),
                      ),
                      onTap: () {
                        // do what you need to do when "Click here" gets clicked
                        Navigator.pushNamed(context, '/');
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )) as FirebaseUser;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }
}
