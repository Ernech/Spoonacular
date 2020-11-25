import 'package:flutter/material.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/usuario_model.dart';

import 'package:spoonacular/src/providers/usuario_provider.dart';
import 'package:spoonacular/src/providers/spoonacular_provider.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';
import 'package:spoonacular/src/widgets/custome_input_account.dart';
import 'package:spoonacular/src/widgets/line_circule_detail.dart';
import 'package:spoonacular/utils/utils.dart';
import '../../constants.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final usuarioProvider = new UsuarioProvider();
  final spoonacularProvider = new SpoonacularProvider();
  final prefs = PreferenciasUsuario();
  UsuarioBloc usuarioBloc;
  @override
  Widget build(BuildContext context) {
    final registerBloc = Provider.registerBloc(context);
    final size = MediaQuery.of(context).size;
    usuarioBloc = Provider.usuarioBLoc(context);
    final horizontalPadding = size.width;
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              new Container(
                child: new Image.asset(
                  'images/logo.png',
                  height: 140.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                prefs.idioma == 0
                    ? "Sign up in Nutrana"
                    : "Registrate en Nutrana",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Pacifico",
                  color: Color(0xFF5B8C2A),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              CustomeInputAccount(
                  prefs.idioma == 0 ? "First Name" : "Nombre",
                  Icons.person,
                  prefs.idioma == 0 ? "First Name" : "Nombre",
                  registerBloc.usernameStream,
                  registerBloc.changeUsername),
              SizedBox(
                height: 10,
              ),
              CustomeInputAccount(
                  prefs.idioma == 0 ? "Last Name" : "Apellido Paterno",
                  Icons.person,
                  prefs.idioma == 0 ? "Last Name" : "Apellido Paterno",
                  registerBloc.apPaternoStream,
                  registerBloc.changeApPaterno),
              SizedBox(
                height: 10,
              ),
              CustomeInputAccount(
                  prefs.idioma == 0 ? "Mother's Last Name" : "Apellido Materno",
                  Icons.person,
                  prefs.idioma == 0 ? "Mother's Last Name" : "Apellido Materno",
                  registerBloc.apMaternoStream,
                  registerBloc.changeApMaterno),
              SizedBox(
                height: 10,
              ),
              //CustomeInput("Correo", Icons.person, "Correo Electronico"),
              _crearEmail(registerBloc),
              SizedBox(
                height: 10,
              ),
              // CustomeInput("Contraseña", Icons.lock, "Contraseña"),
              _crearPassword(registerBloc),
              SizedBox(
                height: 20,
              ),
              _crearBoton(registerBloc, usuarioBloc, horizontalPadding),
              SizedBox(
                height: 10,
              ),
              LineCirculeDetail(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    prefs.idioma == 0
                        ? "Already have an account?"
                        : "¿Ya tienes cuenta?",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Muli",
                      color: primaryBlack,
                    ),
                  ),
                  GestureDetector(
                      child: Text(
                        prefs.idioma == 0 ? "Login here" : "Ingresa por aquí",
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

  Widget _crearEmail(RegisterBloc loginbloc) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Text(
                prefs.idioma == 0 ? "Email" : "Correo Electrónico",
                style: TextStyle(
                    color: primaryGreen,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.white,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: StreamBuilder(
              stream: loginbloc.emailStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: loginbloc.changeEmail,
                  decoration: InputDecoration(
                    errorText: snapshot.error,
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.alternate_email,
                      color: Colors.grey,
                    ),
                    hintText:
                        prefs.idioma == 0 ? "Email" : "Correo Electrónico",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _crearPassword(RegisterBloc loginbloc) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Text(
                prefs.idioma == 0 ? "Password" : "Contraseña",
                style: TextStyle(
                    color: primaryGreen,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.white,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: StreamBuilder(
              stream: loginbloc.passwordStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return TextFormField(
                  onChanged: loginbloc.changePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorText: snapshot.error,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    hintText: prefs.idioma == 0 ? "Password" : "Contraseña",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _crearBoton(RegisterBloc registerBloc, UsuarioBloc usuarioBloc,
      double horizontalPadding) {
    return StreamBuilder(
        stream: registerBloc.registerFormValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return RaisedButton(
              textColor: Colors.white,
              padding: EdgeInsets.all(0.0),
              shape: StadiumBorder(),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: primaryGreenLight),
                child: Text(
                  prefs.idioma == 0 ? "SIGN UP" : "CREAR CUENTA",
                  style: TextStyle(fontSize: 15.0),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding / 3, vertical: 15.0),
              ),
              onPressed: snapshot.hasData
                  ? () => _registrarse(registerBloc, usuarioBloc, context)
                  : null);
        });
  }

  _registrarse(
      RegisterBloc bloc, UsuarioBloc usuarioBloc, BuildContext context) async {
    final info = await usuarioProvider.nuevoUsuatio(bloc.email, bloc.password);

    if (info['ok']) {
      //  Navigator.pushReplacementNamed(context, '/');
      _registrarseSpoonacular(
          bloc.username, bloc.apPaterno, bloc.apMaterno, bloc.email);
    } else {
      mostarAlerta(
          context,
          prefs.idioma == 0 ? "Error" : "Error al registrarse",
          info['mensaje']);
    }
  }

  _registrarseSpoonacular(String firstname, String lastNameP, String lastNameM,
      String email) async {
    final info = await spoonacularProvider.registroSpoonacular(
        firstname, lastNameP, lastNameM, email);
    if (info['status'] != 200) {
      print('error');
    } else {
      final usuario = new UsuarioModel();
      usuario.firstName = info['firstName'];
      usuario.lastNameP = info['lastNameP'];
      usuario.lastNameM = info['lastNameM'];
      usuario.email = info['email'];
      usuario.username = info['username'];
      usuario.hash = info['hash'];
      _registroUsuarioFirebase(usuario);
    }
  }

  _registroUsuarioFirebase(UsuarioModel usuarioModel) {
    usuarioBloc.registrarUsuario(usuarioModel);

    Navigator.pushReplacementNamed(context, '/');
    mostarAlerta(
        context,
        prefs.idioma == 0 ? "Successful Sign Up " : "Usuario Registrado",
        prefs.idioma == 0
            ? "Your signup has been successful"
            : "El registro ha sido exitoso");
  }
}
