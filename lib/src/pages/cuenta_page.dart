import 'package:flutter/material.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/usuario_model.dart';
import 'package:spoonacular/src/providers/usuario_provider.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';
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
  final formKey = GlobalKey<FormState>();
  String npass;
  UsuarioModel usuario = new UsuarioModel();
  String firstName, lastNameP, lastNameM, email;
  final usuarioProvider = new UsuarioProvider();
  List _tiposDietas = ['Vegetariano', 'Vegano', 'No Gluten', 'Omnivoro'];
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapToken = utils.parseJwt(prefs.token);
    final usuarioBloc = Provider.usuarioBLoc(context);
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
            child: FutureBuilder(
                future: usuarioProvider.cargarUsuarioFirebase(
                    mapToken['firebase']['identities']['email'][0]),
                initialData: null,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    usuario = snapshot.data;
                    firstName = usuario.firstName;
                    lastNameP = usuario.lastNameP;
                    lastNameM = usuario.lastNameM;
                    List<String> inicial = firstName.split('');
                    return Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconUser(
                              inicial[0], '$firstName $lastNameP $lastNameM'),
                          SizedBox(
                            height: 5,
                          ),
                          LineCirculeDetail(),
                          _crearNombreUsuario(usuario),
                          SizedBox(
                            height: 10,
                          ),
                          _crearApPaterno(usuario),
                          SizedBox(
                            height: 10,
                          ),
                          _crearApMaterno(usuario),
                          SizedBox(
                            height: 10,
                          ),
                          _crearCorreo(usuario),
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
                          _crearBotonGuardarCambios(
                              usuarioBloc, usuario, prefs.token),
                          SizedBox(
                            height: 10,
                          ),
                          _crearBotonCerrarSesion(prefs, context, usuario)
                        ],
                      ),
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
    Navigator.pushReplacementNamed(context, '/');
    usuario = null;
    prefs.token = null;
  }

  Widget _crearNombreUsuario(UsuarioModel usuario) {
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
              initialValue: usuario.firstName,
              onSaved: (value) => usuario.firstName = value,
              onChanged: (value) => usuario.firstName = value,
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

  Widget _crearApPaterno(UsuarioModel usuario) {
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
            initialValue: usuario.lastNameP,
            onSaved: (value) => usuario.lastNameP = value,
            onChanged: (value) => usuario.lastNameP = value,
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

  Widget _crearApMaterno(UsuarioModel usuario) {
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
              initialValue: usuario.lastNameM,
              onSaved: (value) => usuario.lastNameM = value,
              onChanged: (value) => usuario.lastNameM = value,
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

  Widget _crearCorreo(UsuarioModel usuario) {
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
              onSaved: (value) => usuario.email = value,
              onChanged: (value) => usuario.email = value,
              initialValue: usuario.email,
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
              validator: (value) {
                Pattern pattern =
                    r'^[a-zA-Z0-9.!#$%&+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$';
                //Pattern pattern = r'^(([^<>()[]\.,;:\s@"]+(.[^<>()[]\.,;:\s@"]+)*)|(".+"))@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z-0-9]+.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                if (regExp.hasMatch(value)) {
                  return null;
                } else {
                  return 'El email no es correcto';
                }
              },
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
                "Nueva Contraseña (Opcional)",
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
              onChanged: (value) => npass = value,
              onSaved: (value) => npass = value,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                hintText: "Nueva Contraseña",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            )),
      ],
    );
  }

  Widget _crearBotonGuardarCambios(
      UsuarioBloc usuarioBloc, UsuarioModel usuarion, String idToken) {
    return RaisedButton(
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        shape: StadiumBorder(),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0), color: primaryGreen),
          child: Text(
            "GUARDAR",
            style: TextStyle(fontSize: 15.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 15.0),
        ),
        onPressed: () {
          usuarioBloc.modificarUsuario(usuario);
          _cambiarCorreo(idToken);
          if (npass == null || npass.length == 0 || npass == '') {
            utils.mostarAlerta(
                context, 'Cambios guardados', 'Usuario Modificado');
          } else {
            if (npass.length < 6) {
              utils.mostarAlerta(context, 'Error',
                  'La nueva contraseña debe contener al menos 6 caracteres');
            } else {
              _cambiarPassword(idToken);
              utils.mostarAlerta(
                  context, 'Cambios guardados', 'Usuario Modificado');
            }
            setState(() {
              firstName = usuario.firstName;
              lastNameP = usuario.lastNameP;
              lastNameM = usuario.lastNameM;
            });
          }
        });
  }

  _cambiarCorreo(String idToken) async {
    Map<String, dynamic> result =
        await usuarioProvider.cambiarCorreo(idToken, usuario.email);
    if (result['ok']) {
      prefs.token = result['idToken'];
    } else {
      utils.mostarAlerta(context, "Error", "No se pudo actualizar sus datos");
    }
  }

  _cambiarPassword(String idToken) async {
    Map<String, dynamic> result =
        await usuarioProvider.cambiarPassword(idToken, npass);
    if (result['ok']) {
      prefs.token = result['idToken'];
    } else {
      utils.mostarAlerta(context, "Error", "No se pudo actualizar sus datos");
    }
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
