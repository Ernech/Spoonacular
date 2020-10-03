import 'package:flutter/material.dart';

class TituloPrimario extends StatelessWidget {
  String tituloTexto = "";

  TituloPrimario(this.tituloTexto);

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
              fontSize: 24,
              fontFamily: "Rubik",
              fontWeight: FontWeight.bold,
              color: Color(0xFF5B8C2A),
            ),
          ),
        ],
      ),
    );
  }
}
