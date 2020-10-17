import 'package:flutter/material.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/custome_input.dart';
import 'package:spoonacular/src/widgets/line_circule_detail.dart';
import 'package:spoonacular/src/widgets/widget_icon_user.dart';

import '../../constants.dart';

class CuentaPage extends StatefulWidget {
  const CuentaPage({Key key}) : super(key: key);

  @override
  _CuentaPageState createState() => _CuentaPageState();
}

class _CuentaPageState extends State<CuentaPage> {
  String _dietaValue;
  List _tiposDietas=['Vegetariano','Vegano','No Gluten','Omnivoro'];
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconUser("A","Ariel Colque Herrera"),
                SizedBox(height: 10,),
                LineCirculeDetail(),
                CustomeInput("Usuario",Icons.person,"Nombre de usuario"),
                SizedBox(height: 20,),
                CustomeInput("Correo",Icons.alternate_email,"Correo Electronico"),
                SizedBox(height: 20,),
                CustomeInput("Contraseña",Icons.lock,"Contraseña"),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 34 ),
                      child: Text("Dieta",style: TextStyle(color: primaryGreen,fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 36,right: 36,bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Text("Escoja una dieta"),
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          value: _dietaValue,
                          onChanged: (value) {
                            setState(() {
                              _dietaValue = value;
                            });
                          },
                          items: _tiposDietas.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
