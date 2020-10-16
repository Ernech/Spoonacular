import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/menu_item_detail_model.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/parrafo_general.dart';
import 'package:spoonacular/src/widgets/subtitulo_general.dart';

class IngredientesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int idMenuItem = ModalRoute.of(context).settings.arguments;
    final spoonacularBloc = Provider.spoonacularBloc(context);
    spoonacularBloc.cargarMenuItemDetail(idMenuItem);
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
            SizedBox(
              height: 215,
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
                            StreamBuilder(
                              stream: spoonacularBloc.menuItemDetailStream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<MenuItemDetail> snapshot) {
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
                            SubtituloGeneral("Descripcion"),
                            ParrafoGeneral(
                                "La tradicional ensalada Napolitana proviene de Italia de la región de Nápoles, de allí "
                                "su nombre; sus colores predominantes son verde.",
                                primaryBlack),
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
