import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/bloc/login_bloc.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/providers/usuario_provider.dart';
import 'package:spoonacular/src/widgets/custome_input.dart';
import 'package:spoonacular/src/widgets/line_circule_detail.dart';
import 'package:spoonacular/utils/utils.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    final loginbloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width;

    print('Padding $horizontalPadding');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              new Container(
                child: new Image.asset(
                  'images/logo.png',
                  height:MediaQuery.of(context).size.height*0.20,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width *0.80,
                child: FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text(
                    "Bienvenido a Nutrana",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: "Pacifico",
                      color: Color(0xFF5B8C2A),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              CustomeInput("Correo", Icons.person, "Correo Electronico",
                  loginbloc, false, TextInputType.emailAddress),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              CustomeInput("Contraseña", Icons.lock, "Contraseña", loginbloc,
                  true, null),
              SizedBox(
                height:  MediaQuery.of(context).size.height*0.02,
              ),
              SizedBox(
                height:  MediaQuery.of(context).size.height*0.02,
              ),
              crearBoton(loginbloc, horizontalPadding),
              SizedBox(
                height:  MediaQuery.of(context).size.height*0.02,
              ),
              LineCirculeDetail(),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width *0.60,
                child: FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Row(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget crearBoton(LoginBloc loginBloc, double horizontalPadding) {
    return StreamBuilder(
        stream: loginBloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return RaisedButton(
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            shape: StadiumBorder(),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: primaryGreen),
              child: Text(
                'INGRESAR',
                style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.025,color: primaryWhite),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width*0.3, vertical:  MediaQuery.of(context).size.height*0.02),
            ),
            onPressed:
                snapshot.hasData ? () => _ingresar(loginBloc, context) : null,
          );
        });
  }

  _ingresar(LoginBloc bloc, BuildContext context) async {
    Map info = await usuarioProvider.login(bloc.email, bloc.password);
    if (info['ok']) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      mostarAlerta(context, 'Información incorrecta', info['mensaje']);
    }

    // Navigator.pushReplacementNamed(context, 'home');
  }
}
