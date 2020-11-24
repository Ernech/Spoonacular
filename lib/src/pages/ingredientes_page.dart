import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/ingredients_model.dart';
import 'package:spoonacular/src/models/menu_item_detail_model.dart';
import 'package:spoonacular/src/widgets/banner_ingredientes.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/nutriente_widget.dart';
import 'package:spoonacular/src/widgets/nutrientesImportantes.dart';
import 'package:spoonacular/src/widgets/parrafo_general.dart';
import 'package:spoonacular/src/widgets/subtitulo_general.dart';

class IngredientesPage extends StatelessWidget {
  String tag;
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context).settings.arguments;
    final menuItem = arguments['menuItem'];
    final spoonacularBloc = Provider.spoonacularBloc(context);
    spoonacularBloc.cargarMenuItemDetail(arguments['id']);
    spoonacularBloc.cargarIngredientes(arguments['id']);
    print('ID: ${arguments['id']}');
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
              height: 150,
              width: 150,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(100.0),
                border: Border.all(
                  color: Colors.white,
                  width: 7.5,
                ),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: _crearImagen(menuItem.image)),
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 36, right: 36, top: 25),
                          child: Column(
                            children: [
                              SubtituloGeneral("Nombre del plato"),
                              ParrafoGeneral(menuItem.title, primaryGreen),
                              // StreamBuilder(
                              //   stream: spoonacularBloc.menuItemDetailStream,
                              //   builder: (BuildContext context,
                              //       AsyncSnapshot<MenuItemDetail> snapshot) {
                              //     if (snapshot.hasData) {
                              //       MenuItemDetail menuItemDetail =
                              //           snapshot.data;
                              //       return ParrafoGeneral(
                              //           menuItemDetail.title, primaryGreen);
                              //     } else {
                              //       return CircularProgressIndicator();
                              //     }
                              //   },
                              // ),
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
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: (nutrientes != null ||
                                                nutrientes.length > 0)
                                            ? _crearNutrientes(nutrientes)
                                            : _chipNoDisponible(
                                                'Nutrientes no disponibles'),
                                      ),
                                    );
                                  }
                                },
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              SubtituloGeneral("Ingredientes"),
                              //
                            ],
                          ),
                        ),
                      ),
                      _crearIngredients(spoonacularBloc),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36.0),
                        child: Column(
                          children: [
                            SubtituloGeneral("Nutrientes Importantes"),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child:
                                  _crearNutrientesImportantes(spoonacularBloc),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _crearNutrientes(List<Nutrients> nutrientes) {
    List<Widget> tarjetasNutrientes = new List();
    for (int i = 0; i < nutrientes.length; i++) {
      Widget tarjeta = Column(
        children: [
          Container(
            child: NutrienteWidget(nutrientes[i].title, nutrientes[i].amount,
                nutrientes[i].unit, nutrientes[i].percentOfDailyNeeds),
          ),
        ],
      );
      tarjetasNutrientes.add(tarjeta);
    }
    return tarjetasNutrientes;
  }

  Widget _chipNoDisponible(String text) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(color: primaryWhite, fontSize: 12),
      ),
      backgroundColor: primaryBrown,
    );
  }

  Widget _crearNutrientesImportantes(SpoonacularBloc spoonacularBloc) {
    return StreamBuilder(
      stream: spoonacularBloc.menuItemDetailStream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          final MenuItemDetail menuItemDetail = snapshot.data;
          return Row(
            children: [
              NutrientesImportantes(
                  "Calorias", menuItemDetail.nutrition['calories'], 0),
              NutrientesImportantes(
                  "Grasa", menuItemDetail.nutrition['fat'], 1),
              NutrientesImportantes(
                  "Proteinas", menuItemDetail.nutrition['protein'], 2),
              NutrientesImportantes(
                  "Carbo...", menuItemDetail.nutrition['carbs'], 3),
            ],
          );
        }
      },
    );
  }

  Widget _crearIngredients(SpoonacularBloc spoonacularBloc) {
    return StreamBuilder(
      stream: spoonacularBloc.ingredientsStream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final List<Ingredient> ingredientes = snapshot.data;
          print('Ingredientes: $ingredientes');
          return BannerIngredientes(ingredientes);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _crearImagen(String url) {
    if (url == null || url == '') {
      return Image(
        image: AssetImage('images/no-image.png'),
        height: 100.0,
        width: 100.0,
      );
    } else {
      return Image.network(
        url,
        height: 100.0,
        width: 100.0,
      );
    }
  }
}
