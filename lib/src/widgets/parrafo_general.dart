import 'package:flutter/material.dart';

import '../../constants.dart';

class ParrafoGeneral extends StatelessWidget {
  String parrafoTexto;
  Color color;

  ParrafoGeneral(this.parrafoTexto, this.color);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        parrafoTexto,
        style: TextStyle(
            fontSize: 22,
            fontFamily: "Muli",
            fontWeight: FontWeight.bold,
            color: color),
      ),
    );
  }
}
