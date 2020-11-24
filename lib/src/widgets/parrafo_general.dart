import 'package:flutter/material.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';
import 'package:spoonacular/utils/utils.dart' as utils;

class ParrafoGeneral extends StatelessWidget {
  final String parrafoTexto;
  final Color color;
  final prefs = PreferenciasUsuario();
  ParrafoGeneral(this.parrafoTexto, this.color);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Align(
          alignment: Alignment.bottomLeft,
          child: _crearTexto(prefs, parrafoTexto)),
    );
  }

  Widget _crearTexto(PreferenciasUsuario prefs, String title) {
    switch (prefs.idioma) {
      case 0:
        return Text(parrafoTexto,
            style: TextStyle(
                fontSize: 22,
                fontFamily: "Muli",
                fontWeight: FontWeight.bold,
                color: color));
        break;
      case 1:
        return FutureBuilder(
          future: utils.enToEs(title),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return Text(snapshot.data,
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Muli",
                      fontWeight: FontWeight.bold,
                      color: color));
            }
          },
        );
        break;
      default:
        return Text(parrafoTexto,
            style: TextStyle(
                fontSize: 22,
                fontFamily: "Muli",
                fontWeight: FontWeight.bold,
                color: color));
    }
  }
}
