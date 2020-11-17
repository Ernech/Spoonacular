import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:spoonacular/utils/utils.dart' as utils;

// ignore: must_be_immutable
class NutrientesImportantes extends StatelessWidget {
  String tipo;
  dynamic valor;
  int index;

  NutrientesImportantes(this.tipo, this.valor, this.index);

  @override
  Widget build(BuildContext context) {
    Map<String, String> info = _obtenerInfo(index);
    return GestureDetector(
      onTap: () {
        showAlertDialog(context, info);
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 7.5, 5, 5),
            child: Container(
              //width: (MediaQuery.of(context).size.width) / 2.55,
              height: 60,
              width: 80,
              decoration: BoxDecoration(
                color: primaryGreenLight,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 3.0,
                      blurRadius: 5.0),
                ],
              ),
            ),
          ),
          Positioned(
            top: 18,
            child: Container(
              width: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tipo,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Muli",
                        fontWeight: FontWeight.bold,
                        color: primaryWhite),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    valor.toString(),
                    style: TextStyle(
                        fontSize: 14, fontFamily: "Muli", color: primaryWhite),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context, Map<String, String> info) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "Ok",
        style: TextStyle(color: primaryGreen),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        info['tipo'],
        style: TextStyle(
            color: primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.05),
      ),
      //content: Text('$numero'),
      content: Container(
        width: 200.0,
        height: 260.0,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "¿Que es?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: primaryBrown),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                info['concepto'],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Cantidad minima diaria",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: primaryBrown),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  info['cantidad'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        cancelButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Map<String, String> _obtenerInfo(int index) {
    switch (index) {
      case 0:
        return utils.nutrientesImportantes[0];
        break;
      case 1:
        return utils.nutrientesImportantes[1];
        break;
      case 2:
        return utils.nutrientesImportantes[2];
        break;
      case 3:
        return utils.nutrientesImportantes[3];
        break;
      default:
        return {
          'tipo': 'Error al obtener la información',
          'cantidad': 'Error al obtener la información',
          'concepto': 'Error al obtener la información'
        };
    }
  }
}
