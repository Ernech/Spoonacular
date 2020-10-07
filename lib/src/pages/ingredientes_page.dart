import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/widgets/banner_ingredientes.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/parrafo_general.dart';
import 'package:spoonacular/src/widgets/subtitulo_general.dart';
import 'package:spoonacular/src/widgets/titulo_secundario.dart';

class IngredientesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFCDDE47), Colors.white],
        )),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonAtras(),
              ],
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset("images/dish1.png"),
            ),
            SizedBox(height: 50,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 36, right: 36, top: 25),
                        child: Column(
                          children: [
                            SubtituloGeneral("Nombre del plato"),
                            ParrafoGeneral("Ensalda Napolitana", primaryGreen),
                            SizedBox(
                              height: 15,
                            ),
                            SubtituloGeneral("Descripcion"),
                            ParrafoGeneral(
                                "La tradicional ensalada Napolitana proviene de Italia de la región de Nápoles, de allí "
                                "su nombre; sus colores predominantes son verde.",
                                primaryBlack),
                            SizedBox(
                              height: 15,
                            ),
                            SubtituloGeneral("Ingredientes"),
                          ],
                        ),
                      ),
                    ),
                    BannerIngredientes(),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 36, right: 36, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.favorite),
                                    color: primaryGreen,
                                    onPressed: () {
                                      print("favorito");
                                    },
                                  ),
                                  Text(
                                    "10",
                                    style: TextStyle(
                                        color: primaryGreen,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Bs 40",
                              style: TextStyle(
                                  color: primaryGreen,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
