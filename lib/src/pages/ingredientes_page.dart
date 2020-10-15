import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/widgets/banner_ingredientes.dart';
import 'package:spoonacular/src/models/menu_item_detail_model.dart';
import 'package:spoonacular/src/providers/spoonacular_provider.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/parrafo_general.dart';
import 'package:spoonacular/src/widgets/subtitulo_general.dart';

class IngredientesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int idMenuItem = ModalRoute.of(context).settings.arguments;
    SpoonacularProvider spoonacularProvider = SpoonacularProvider();
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
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.45),
                      blurRadius: 40,
                      offset: Offset(0, -1.0),
                    ),
                  ],
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
                            FutureBuilder(
                              future: spoonacularProvider
                                  .getMenuItemDetail(idMenuItem),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.hasData) {
                                  MenuItemDetail menuItemDetail = snapshot.data;
                                  return ParrafoGeneral(
                                      menuItemDetail.title, primaryGreen);
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SubtituloGeneral("Nutrientes"),
/*                            ParrafoGeneral(
                                "La tradicional ensalada Napolitana proviene de Italia de la región de Nápoles, de allí "
                                "su nombre; sus colores predominantes son verde.",
                                primaryBlack),*/
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 130,
                                          decoration: BoxDecoration(
                                            /*shape: BoxShape.circle,*/
                                            color: primaryYellow,
                                            borderRadius: new BorderRadius.all(Radius.elliptical(100, 100)),
                                            boxShadow: [
                                              /*BoxShadow(
                                                color: primaryBlack,
                                                offset: Offset(0.0, 1.0),
                                                //(x,y)
                                                blurRadius: 6.0,
                                              ),*/
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                        /*child: Row(
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
                        ),*/
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
