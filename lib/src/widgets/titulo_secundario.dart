import 'package:flutter/material.dart';

class TituloSecundario extends StatelessWidget {
  String tituloTexto="";
  TituloSecundario(this.tituloTexto);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 36, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            tituloTexto,
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Muli",
                fontWeight: FontWeight.bold,
                color: Color(0xFF828282)),
          ),
        ],
      ),
    );
  }
}
