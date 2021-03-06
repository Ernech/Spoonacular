import 'package:flutter/material.dart';

import '../../constants.dart';

class IconUser extends StatelessWidget {
  String inicialUsuario;
  String nombreUsuario;
  IconUser(this.inicialUsuario,this.nombreUsuario);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: primaryWhite,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Center(
            child: Text(
              inicialUsuario,
              style: TextStyle(fontSize: 30, color: primaryGreen),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          nombreUsuario.toUpperCase(),
          style: TextStyle(color: primaryBlack, fontSize: 16),
        ),
      ],
    );
  }
}
