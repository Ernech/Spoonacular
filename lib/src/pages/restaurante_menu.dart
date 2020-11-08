import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:spoonacular/src/widgets/banner_menu.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/titulo_card.dart';
import 'package:spoonacular/src/widgets/titulo_primario.dart';
import 'package:spoonacular/src/widgets/titulo_secundario.dart';

class RestauranteMenuPage extends StatelessWidget {
  //const RestauranteMenuPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final spoonacularBloc = Provider.spoonacularBloc(context);
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonAtras(),
                  TituloSecundario("Restaurante"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TituloPrimario("Leckerbrot"),
              SizedBox(
                height: 5,
              ),
              TituloCard("Platos principales",primaryBlack),
              _bannerMenu(spoonacularBloc),
              TituloCard("Otros",primaryBlack),
              _bannerMenu(spoonacularBloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerMenu(SpoonacularBloc bloc) {
    bloc.cargarMenuItems('pollo');
    return StreamBuilder(
      stream: bloc.menuItemsStream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<List<MenuItem>> snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          List<MenuItem> items = snapshot.data;
          return BannerMenu(menuItems: items);
        }
      },
    );
  }
}
