import 'package:flutter/material.dart';
import '../../constants.dart';

class NutrienteWidget extends StatelessWidget {
  String nutriente;
  int cantidadNutriente;
  NutrienteWidget(this.nutriente,this.cantidadNutriente);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Stack(
        children: [
          Container(

            width: 80,
            height: 130,
            decoration: BoxDecoration(
              /*shape: BoxShape.circle,*/
              color: primaryYellow,
              borderRadius: new BorderRadius.all(Radius.elliptical(100, 100)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.5), //(x,y)
                  blurRadius: 6.0,
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
                child: Text(
                  ("$cantidadNutriente gramos"),
                  style: TextStyle(
                      color: primaryBrown,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
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
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
