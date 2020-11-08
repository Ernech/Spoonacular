import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/widgets/banner_alimentos-permitidos.dart';
import 'package:spoonacular/src/widgets/button_atras.dart';
import 'package:spoonacular/src/widgets/titulo_card.dart';
import 'package:spoonacular/src/widgets/titulo_primario.dart';
import 'package:spoonacular/src/widgets/titulo_secundario.dart';

class EstiloVidaPage extends StatelessWidget {
  //const RestauranteMenuPage({Key key}) : super(key: key);
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
                  TituloSecundario("Estilo de Vida"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TituloPrimario("Vegetariano"),
              SizedBox(
                height: 5,
              ),
              TituloCard("Informacion General", primaryGreen),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34.0),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Image.asset(
                          "images/vegetarian.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: FractionalOffset.bottomLeft,
                                end: FractionalOffset.topCenter,
                                colors: [Colors.black87, Colors.transparent]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Vegetariano",
                                style: TextStyle(
                                    fontSize: 25, color: primaryWhite)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 34, vertical: 20),
                child: Text(
                  "Esta dieta excluye toda la carne, el pescado y los subproductos animales que requieren la muerte del animal (como el caldo elaborado con huesos o gelatina). Por lo general, es rico en legumbres (por ejemplo, frijoles y lentejas), granos, frutas, verduras, nueces y semillas. Los vegetarianos que comen huevos pero no lácteos se conocen como ovo vegetarianos, mientras que los vegetarianos que comen lácteos pero no huevos se conocen como lacto vegetarianos.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              TituloCard("Alimentos Permitidos", primaryGreen),
              BannerAlimentosPermitidos(),

              TituloCard("Alimentos No Permitidos", primaryGreen),
              BannerAlimentosPermitidos(),
            ],
          ),
        ),
      ),
    );
  }
}
