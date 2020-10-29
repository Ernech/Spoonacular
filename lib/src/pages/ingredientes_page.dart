import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:spoonacular/src/widgets/banner_ingredientes.dart';
import 'package:spoonacular/src/models/menu_item_detail_model.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/nutriente_widget.dart';
import 'package:spoonacular/src/widgets/parrafo_general.dart';
import 'package:spoonacular/src/widgets/subtitulo_general.dart';

class IngredientesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context).settings.arguments;
    final menuItem = arguments['menuItem'];
    final spoonacularBloc = Provider.spoonacularBloc(context);
    spoonacularBloc.cargarMenuItemDetail(arguments['id']);
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
              child: FadeInImage(
                  placeholder: AssetImage('images/loading-circle.gif'),
                  image: NetworkImage(menuItem.image)),
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
                            // SizedBox(
                            //   height: 15,
                            // ),
                            SubtituloGeneral("Nutrientes"),
                            // ParrafoGeneral(
                            //     "La tradicional ensalada Napolitana proviene de Italia de la región de Nápoles, de allí "
                            //     "su nombre; sus colores predominantes son verde.",
                            //     primaryBlack),

                            StreamBuilder(
                              stream: spoonacularBloc.menuItemDetailStream,
                              initialData: null,
                              builder: (BuildContext context,
                                  AsyncSnapshot<MenuItemDetail> snapshot) {
                                if (!snapshot.hasData) {
                                  return CircularProgressIndicator();
                                } else {
                                  final MenuItemDetail menuItemDetail =
                                      snapshot.data;
                                  final List<Nutrients> nutrientes =
                                      menuItemDetail.obtenerNutrientes(
                                          menuItemDetail
                                              .nutrition['nutrients']);
                                  return Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            child: NutrienteWidget(
                                                nutrientes[0].title,
                                                nutrientes[0].amount,
                                                nutrientes[0].unit),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            child: NutrienteWidget(
                                                nutrientes[1].title,
                                                nutrientes[1].amount,
                                                nutrientes[1].unit),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            child: NutrienteWidget(
                                                nutrientes[2].title,
                                                nutrientes[2].amount,
                                                nutrientes[2].unit),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            child: NutrienteWidget(
                                                nutrientes[3].title,
                                                nutrientes[3].amount,
                                                nutrientes[3].unit),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              },
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
