import 'package:flutter/material.dart';
import 'package:spoonacular/src/models/restaurante_model.dart';
import 'package:spoonacular/src/pages/restaurante_menu.dart';

class BannerWidgetArea extends StatelessWidget {
  List<RestauranteModel> restaurantes;
  BannerWidgetArea(this.restaurantes);
  final bannerItems = ["a", "b", "c", "d", "e", "f"];
  final bannerImages = [
    "images/leckerbrot.jpg",
    "images/ventanita.jpg",
    "images/aguacate.jpg",
    "images/lupito.jpg",
    "images/manadeoscileos.jpg",
    "images/wellness.jpg"
  ];

  final nombresRestaurantes = [
    "Leckerbrot",
    "Ventanita",
    "Aguacate",
    "Lupito",
    "Mana de los cielos",
    "Wellness food"
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    // restaurantes.removeAt(7);
    // restaurantes.removeAt(26);
    // restaurantes.removeAt(65);
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < restaurantes.length; i++) {
      var bannerView = GestureDetector(
        onTap: () {
          print("Container" + i.toString());
          Navigator.pushNamed(context, '/restauranteMenu',
              arguments: restaurantes[i].nombre);
          //Navigator.pushNamed(context, '/restaurantemenu');
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(restaurantes[i].url.trim()
                        //'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Pizza_73_Logo.svg/1200px-Pizza_73_Logo.svg.png'
                        ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                restaurantes[i].nombre,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F4F4F)),
              ),
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    //PageController controller =
    //    PageController(viewportFraction: 0.6, initialPage: 0);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: banners,
      ),
    );
  }
}
