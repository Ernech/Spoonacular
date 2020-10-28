import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/src/bloc/login_bloc.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/pages/inicio_page.dart';
import 'package:spoonacular/src/providers/usuario_provider.dart';
import 'package:spoonacular/src/widgets/line_circule_detail.dart';
import 'package:spoonacular/utils/utils.dart';
import '../../constants.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    final loginBloc = Provider.of(context);
    
    return Scaffold(
      body: Center(
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
                decoration: const InputDecoration(
                  labelText: "Nombre de Usuario",
                ),
                validator: (String val) {
                  if (val.isEmpty) {
                    return "Ingrese algun texto";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              //CustomeInput("Correo", Icons.person, "Correo Electronico"),
              _crearEmail(loginBloc),
              SizedBox(
                height: 20,
              ),
              // CustomeInput("Contraseña", Icons.lock, "Contraseña"),
              _crearPassword(loginBloc),

              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              _crearBoton(loginBloc),
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

  Widget _crearEmail(LoginBloc loginbloc) {
    return StreamBuilder(
        stream: loginbloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: loginbloc.changeEmail,
            decoration: InputDecoration(
              labelText: "Correo Electronico",
              errorText: snapshot.error
            ),
          );
        });
  }

  Widget _crearPassword(LoginBloc loginbloc) {
    return StreamBuilder(
        stream: loginbloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextFormField(
            onChanged: loginbloc.changePassword,
            obscureText: true,
            decoration:  InputDecoration(
              labelText: "Contraseña",
              errorText: snapshot.error
            ),
          );
        });
  }

  Widget _crearBoton(LoginBloc loginbloc) {
    return StreamBuilder(
      stream: loginbloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
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
        padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
      ),
      onPressed: snapshot.hasData ? () => _registrarse(loginbloc, context) : null
    );
      });
    
    
    
  }

  _registrarse(LoginBloc bloc, BuildContext context) async {
    final info = await usuarioProvider.nuevoUsuatio(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context,'/');
    } else {
      mostarAlerta(context, info['mensaje']);
    }
  }
}
