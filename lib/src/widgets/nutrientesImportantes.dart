import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:spoonacular/utils/utils.dart' as utils;

// ignore: must_be_immutable
class NutrientesImportantes extends StatelessWidget {
  String tipo;
  double unidad;

  NutrientesImportantes(this.tipo, this.unidad);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context, 0);
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                child: Text(
                  tipo,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Muli",
                      fontWeight: FontWeight.bold,
                      color: primaryWhite),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  '$unidad',
                  style: TextStyle(
                      fontSize: 14, fontFamily: "Muli", color: primaryWhite),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context, int numero) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Nutriente"),
      content: Text('$numero'),
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
