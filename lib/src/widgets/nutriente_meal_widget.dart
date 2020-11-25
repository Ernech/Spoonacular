import 'package:flutter/material.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';
import '../../constants.dart';
import 'package:spoonacular/utils/utils.dart' as utils;

// ignore: must_be_immutable
class NutrienteMealWidget extends StatelessWidget {
  final prefs = PreferenciasUsuario();
  String nutriente;
  String cantidadNutriente;
  double percentOfDailyNeeds;
  NutrienteMealWidget(
      this.nutriente, this.cantidadNutriente, this.percentOfDailyNeeds);
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
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 25,
                child:
                    Container(width: 80, child: _crearTexto(prefs, nutriente)),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            prefs.idioma == 0 ? "% Diary" : "% Diario",
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

  Widget _crearTexto(PreferenciasUsuario prefs, String nutriente) {
    switch (prefs.idioma) {
      case 0:
        return Text(
          nutriente,
          style: TextStyle(
            color: primaryWhite,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        );
        break;
      case 1:
        return FutureBuilder(
          future: utils.traducirAEs(nutriente),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return Text(
                snapshot.data,
                style: TextStyle(
                  color: primaryWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              );
            }
          },
        );
        break;
      default:
        return Text(
          nutriente,
          style: TextStyle(
            color: primaryWhite,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        );
    }
  }
}
