import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/ingredients_model.dart';
import 'package:spoonacular/src/models/menu_item_detail_model.dart';
import 'package:spoonacular/src/widgets/banner_alimentos-permitidos.dart';
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
                child: Image.network(
                  menuItem.image,
                  height: 100.0,
                  width: 100.0,
                ),
              ),
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
                                  print('Nutrientes: ${nutrientes.length}');
                                  String calories =
                                      menuItemDetail.nutrition['fat'];
                                  print('calories $calories');
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: _crearNutrientes(nutrientes),
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
                    //CHIPS DE INGREDIENTES
                    BannerAlimentosPermitidos(),
                    //
                    //BannerIngredientes(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: Column(
                        children: [
                          SubtituloGeneral("Nutrientes Importantes"),
                          Row(
                            children: [
                              NutrientesImportantes("Calorias", 5, 0),
                              NutrientesImportantes("Grasa", 5, 1),
                              NutrientesImportantes("Proteinas", 5, 2),
                              NutrientesImportantes("Carbos", 5, 3),
                            ],
                          ),
                        ],
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

  List<Widget> _crearNutrientes(List<Nutrients> nutrientes) {
    List<Widget> tarjetasNutrientes = new List();
    for (int i = 0; i < nutrientes.length; i++) {
      Widget tarjeta = Column(
        children: [
          Container(
            child: NutrienteWidget(
                nutrientes[i].title, nutrientes[i].amount, nutrientes[i].unit),
          ),
        ],
      );
      tarjetasNutrientes.add(tarjeta);
    }
    return tarjetasNutrientes;
  }

  Widget _testingIngredients(SpoonacularBloc spoonacularBloc) {
    return StreamBuilder(
      stream: spoonacularBloc.ingredientsStream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final List<Ingredient> ingredientes = snapshot.data;
          print('Ingredientes: $ingredientes');
          return Container();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
