import 'package:flutter/material.dart';
import 'package:spoonacular/utils/utils.dart' as utils;


class ParrafoGeneral extends StatelessWidget {
  final String parrafoTexto;
  final Color color;

  ParrafoGeneral(this.parrafoTexto, this.color);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: FutureBuilder(
          initialData: null,
          future: utils.enToEs(parrafoTexto),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data,
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.bold,
                    color: color),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
