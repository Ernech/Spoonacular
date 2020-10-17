import 'package:flutter/material.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/custome_input.dart';
import 'package:spoonacular/src/widgets/line_circule_detail.dart';
import 'package:spoonacular/src/widgets/widget_icon_user.dart';

import '../../constants.dart';

class CuentaPage extends StatelessWidget {
  const CuentaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        )),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconUser("A","Ariel Colque Herrera"),
            SizedBox(height: 10,),
            LineCirculeDetail(),
            CustomeInput("Usuario",Icons.person,"Nombre de usuario"),
            SizedBox(height: 20,),
            CustomeInput("Correo",Icons.person,"Correo Electronico"),
            SizedBox(height: 20,),
            CustomeInput("Contraseña",Icons.lock,"**********"),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
