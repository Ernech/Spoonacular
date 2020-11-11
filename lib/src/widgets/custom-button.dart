import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/models/usuario_model.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  UsuarioModel usuario;

  CustomButton(this.buttonText, this.usuario);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        shape: StadiumBorder(),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0), color: primaryGreen),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 15.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 15.0),
        ),
        onPressed: () {});
  }
}
