import 'package:flutter/material.dart';
import 'package:spoonacular/src/pages/restaurante_menu.dart';

import '../../constants.dart';

class BannerMenu extends StatelessWidget {
  final bannerImagesMenu = [
    "images/dish1.png",
    "images/dish2.png",
    "images/dish3.png",
    "images/dish4.png",
  ];

  final nombresMenuPlato = [
    "Ensalada Napolitana",
    "Ensalada Cesar ",
    "Fideos Romanos",
    "Carne salteada",
  ];

  final dietaMenuPlato = [
    "Vegetariano",
    "Vegano",
    "No gluten",
    "Omnivoro",
  ];
  final preciosMenu = [
    "30",
    "25",
    "45",
    "20",
  ];


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < bannerImagesMenu.length; i++) {
      var bannerView = Container(
        margin: EdgeInsets.only(right: 20),
        height: 280,
        width: 180,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 270,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryWhite,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: -20,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage(
                      bannerImagesMenu[i],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 0,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    color: primaryGreenLight,
                    onPressed: () {
                      print("favorito");
                    },
                  ),
                  Text(
                    "5",
                    style: TextStyle(color: primaryGreenLight),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 130,
              left: 16,
              width: 150,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints( maxWidth: 150 , minHeight: 46),
                        child: Text(
                          nombresMenuPlato[i],
                          style: TextStyle(fontSize: 18, color: primaryGreen,),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Chip(
                        label: Text(
                          dietaMenuPlato[i],
                          style: TextStyle(color: primaryWhite,fontSize: 12),
                        ),
                        backgroundColor: primaryBrown,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bs "+preciosMenu[i],
                        style: TextStyle(
                            fontSize: 16,
                            color: primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Muli"),
                      ),
                      RaisedButton(
                        textColor: Colors.white,
                        color: primaryGreenLight,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        onPressed: () {
                          print("ver menu item $i");
                        },
                        child: Text('Ver', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      banners.add(bannerView);
    }
    //PageController controller =
    //    PageController(viewportFraction: 0.6, initialPage: 0);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Row(
          children: banners,
        ),
      ),
    );
  }
}
