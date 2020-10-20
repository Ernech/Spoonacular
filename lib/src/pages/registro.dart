import 'package:flutter/material.dart';
import 'package:spoonacular/src/widgets/custome_input.dart';
import 'package:spoonacular/src/widgets/line_circule_detail.dart';

import '../../constants.dart';

class Registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              CustomeInput("Usuario", Icons.person, "Nombre de Usuario"),
              SizedBox(
                height: 20,
              ),
              CustomeInput("Correo", Icons.person, "Correo Electronico"),
              SizedBox(
                height: 20,
              ),
              CustomeInput("Contraseña", Icons.lock, "Contraseña"),
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
                height: 40,
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
                        print("clicked link");
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
