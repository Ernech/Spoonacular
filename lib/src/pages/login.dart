import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/pages/registro.dart';
import 'package:spoonacular/src/widgets/line_circule_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'cuenta_page.dart';
import 'googlepage.dart';
import 'inicio_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                "Bienvenido a Nutrana",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "Pacifico",
                  color: Color(0xFF5B8C2A),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //CustomeInput("Correo", Icons.person, "Correo Electronico"),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email', icon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 20,
              ),
              //CustomeInput("Contraseña", Icons.lock, "Contraseña"),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Password', icon: Icon(Icons.vpn_key)),
              ),
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
                      color: primaryGreen),
                  child: Text(
                    'Login(ingresar)',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 150.0, vertical: 15.0),
                ),
                onPressed: () {
                  signInWithEmail();
                },
              ),
              FlatButton(
                child: Text('Register'),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () => _pushPage(context, Registro()),
              ),
              VerticalDivider(),
              FlatButton(
                child: Text('signgoogle'),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () => _pushPage(context, SignInDemo()),
              ),
              FlatButton(
                child: Text('Registro'),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () => _pushPage(context, Registro()),
              ),
              SizedBox(
                height: 40,
              ),
              LineCirculeDetail(),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No tienes cuenta? ",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Muli",
                      color: primaryBlack,
                    ),
                  ),
                  GestureDetector(
                      child: Text(
                        "Crea un aqui",
                        style: TextStyle(
                          color: primaryGreen,
                          fontSize: 14,
                          fontFamily: "Muli",
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/registro');
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signInWithEmail() async {
    // marked async
    // ignore: deprecated_member_use
    FirebaseUser user;
  
    try {
      user = (await _auth.signInWithEmailAndPassword(
          // ignore: deprecated_member_use
          email: _emailController.text, password: _passwordController.text)) as FirebaseUser;
    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        // sign in successful!
        _pushPage(context, InicioPage());
      } else {
        // sign in unsuccessful
        print('sign in Not');
        // ex: prompt the user to try again
      }
    }
  }
}

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
