import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:spoonacular/utils/utils.dart' as utils;

// ignore: must_be_immutable
class NutrienteWidget extends StatelessWidget {
  String nutriente;
  double cantidadNutriente;
  String unidades;
  double percentOfDailyNeeds;
  NutrienteWidget(this.nutriente, this.cantidadNutriente, this.unidades,
      this.percentOfDailyNeeds);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 80,
                height: 145,
                decoration: BoxDecoration(
                  /*shape: BoxShape.circle,*/
                  color: primaryYellow,
                  borderRadius:
                      new BorderRadius.all(Radius.elliptical(100, 100)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.5), //(x,y)
                      blurRadius: 8.0,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 7.5,
                left: 7.5,
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryWhite,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ("$cantidadNutriente"),
                          style: TextStyle(
                              color: primaryBrown,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        Text(
                          ("$unidades"),
                          style: TextStyle(
                              color: primaryBrown,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 25,
                child: Container(
                  width: 80,
                  child: Text(
                    nutriente,
                    style: TextStyle(
                      color: primaryWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "% Diario",
            style: TextStyle(fontFamily: "Muli", color: Color(0xFF828282)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            percentOfDailyNeeds.toString(),
            style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold),
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
