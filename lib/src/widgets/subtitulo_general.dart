import 'package:flutter/material.dart';

class SubtituloGeneral extends StatelessWidget {
  String subtituloTexto;
  String color;

  SubtituloGeneral(this.subtituloTexto);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        subtituloTexto,
        style:
            TextStyle(fontSize: 16, fontFamily: "Muli", color: Color(0xFF828282)),
      ),
    );
  }
}
