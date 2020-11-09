import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:spoonacular/utils/utils.dart' as utils;

// ignore: must_be_immutable
class NutrientesImportantes extends StatelessWidget {
  String tipo;
  double unidad;
  int numero;

  NutrientesImportantes(this.tipo, this.unidad, this.numero);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context, this.numero);
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
                    '$unidad',
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

  void showAlertDialog(BuildContext context, int numero) {
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
        "Caloria",
        style: TextStyle(
            color: primaryGreen, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      //content: Text('$numero'),
      content: Container(
        width: 200.0,
        height: 260.0,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "¿Que es?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: primaryBrown),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  "La caloría es una unidad de energíaa En nutrición, cuando se habla de calorías se refiere a la energía que las personas obtienen de los alimentos y bebidas que consumen, y la energía que usa nuestro propio cuerpo en la actividad física",
                  textAlign: TextAlign.justify),
            ),
            Row(
              children: [
                Text(
                  "Cantidad Minima Diaria",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: primaryBrown),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "2000 Cal",
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.bold),
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
}
