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

  String _dietaValue;
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconUser("A", usuario.firstName),
                        SizedBox(
                          height: 5,
                        ),
                        LineCirculeDetail(),
                        _crearNombreUsuario(),
                        SizedBox(
                          height: 10,
                        ),
                        _crearApPaterno(),
                        SizedBox(
                          height: 10,
                        ),
                        _crearApMaterno(),
                        SizedBox(
                          height: 10,
                        ),
                        _crearCorreo(),
                        SizedBox(
                          height: 10,
                        ),
                        // CustomeInputAccount("Contraseña", Icons.lock, "Contraseña"),
                        _crearPassword(),
                        SizedBox(
                          height: 10,
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        CustomButton("GUARDAR"),
                      ],
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }

  Widget _crearNombreUsuario() {
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
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintText: "Nombre de usuario",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            )),
      ],
    );
  }

  Widget _crearApPaterno() {
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
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintText: "Apellido Paterno",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            )),
      ],
    );
  }

  Widget _crearApMaterno() {
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
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintText: "Apellido Materno",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            )),
      ],
    );
  }

  Widget _crearCorreo() {
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
}
