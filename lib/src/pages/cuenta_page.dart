import 'package:flutter/material.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/usuario_model.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';
import 'package:spoonacular/src/widgets/custom-button.dart';
import 'package:spoonacular/utils/utils.dart' as utils;
import 'package:spoonacular/src/widgets/line_circule_detail.dart';
import 'package:spoonacular/src/widgets/widget_icon_user.dart';

import '../../constants.dart';

class CuentaPage extends StatefulWidget {
  const CuentaPage({Key key}) : super(key: key);

  @override
  _CuentaPageState createState() => _CuentaPageState();
}

class _CuentaPageState extends State<CuentaPage> {
  final prefs = new PreferenciasUsuario();

  String firstName, lastNameP, lastNameM, email;
  List _tiposDietas = ['Vegetariano', 'Vegano', 'No Gluten', 'Omnivoro'];
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapToken = utils.parseJwt(prefs.token);
    final usuarioBloc = Provider.usuarioBLoc(context);
    usuarioBloc.cargarUsuarios(mapToken['firebase']['identities']['email'][0]);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFCDDE47), Colors.white],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: StreamBuilder(
                stream: usuarioBloc.usuarioStream,
                initialData: null,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    UsuarioModel usuario = snapshot.data;
                    firstName = usuario.firstName;
                    lastNameP = usuario.lastNameP;
                    lastNameM = usuario.lastNameM;
                    email = usuario.email;

                    List<String> inicial = usuario.firstName.split('');
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconUser(inicial[0],
                            '${usuario.firstName} ${usuario.lastNameP} ${usuario.lastNameM}'),
                        SizedBox(
                          height: 5,
                        ),
                        LineCirculeDetail(),
                        _crearNombreUsuario(usuario, firstName),
                        SizedBox(
                          height: 10,
                        ),
                        _crearApPaterno(usuario, lastNameP),
                        SizedBox(
                          height: 10,
                        ),
                        _crearApMaterno(usuario, lastNameM),
                        SizedBox(
                          height: 10,
                        ),
                        _crearCorreo(usuario, email),
                        SizedBox(
                          height: 10,
                        ),
                        _crearPassword(),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton("GUARDAR", usuario),
                        SizedBox(
                          height: 10,
                        ),
                        _crearBotonCerrarSesion(prefs, context, usuario)
                      ],
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }

  _cerrarSesion(
      PreferenciasUsuario prefs, BuildContext context, UsuarioModel usuario) {
    Navigator.pushReplacementNamed(context, '/').then((value) {
      setState(() {
        usuario = null;
      });
      prefs.token = null;
    });
  }

  Widget _crearNombreUsuario(UsuarioModel usuario, String init) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Text(
                "Usuario",
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
            child: TextFormField(
              initialValue: init,
              onSaved: (value) => usuario.firstName = value,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintText: "Nombre de usuario",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.length > 0) {
                  return null;
                } else {
                  return 'Campo Obligatorio';
                }
              },
            )),
      ],
    );
  }

  Widget _crearApPaterno(UsuarioModel usuario, String init) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Text(
                "Apellido Paterno",
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
          child: TextFormField(
            initialValue: init,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: "Apellido Paterno",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            validator: (value) {
              if (value.length > 0) {
                return null;
              } else {
                return 'Campo Obligatorio';
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _crearApMaterno(UsuarioModel usuario, String init) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Text(
                "Apellido Materno",
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
            child: TextFormField(
              initialValue: init,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintText: "Apellido Materno",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.length > 0) {
                  return null;
                } else {
                  return 'Campo Obligatorio';
                }
              },
            )),
      ],
    );
  }

  Widget _crearCorreo(UsuarioModel usuario, String init) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Text(
                "Correo",
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
            child: TextFormField(
              initialValue: init,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.grey,
                ),
                hintText: "Correo Electrónico",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            )),
      ],
    );
  }

  Widget _crearPassword() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Text(
                "Contraseña",
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
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                hintText: "Contraseña",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            )),
      ],
    );
  }

  Widget _crearBotonCerrarSesion(
      PreferenciasUsuario prefs, BuildContext context, UsuarioModel usuario) {
    return RaisedButton(
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        shape: StadiumBorder(),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0), color: primaryGreen),
          child: Text(
            "Cerrar Sesión",
            style: TextStyle(fontSize: 15.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 15.0),
        ),
        onPressed: () => _cerrarSesion(prefs, context, usuario));
  }
}
