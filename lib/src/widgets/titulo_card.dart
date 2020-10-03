import 'package:flutter/material.dart';

class TituloCard extends StatelessWidget {
  String tituloTexto="";
  TituloCard(this.tituloTexto);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(36, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            tituloTexto,
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Muli",
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
