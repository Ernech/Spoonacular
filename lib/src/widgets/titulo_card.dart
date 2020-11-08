import 'package:flutter/material.dart';

class TituloCard extends StatelessWidget {
  String tituloTexto="";
  Color color;
  TituloCard(this.tituloTexto,this.color);
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
              color: color,
                fontSize: 16,
                fontFamily: "Muli",
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
