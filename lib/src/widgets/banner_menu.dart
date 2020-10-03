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
    "Carne a la verdura",
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < bannerImagesMenu.length; i++) {
      var bannerView = GestureDetector(
        onTap: () {
          print("Container" + i.toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            margin: EdgeInsets.all(20),
            height: 270,
            width: 190,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 260,
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
                  left: 10,
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
                  top: 150,
                  left: 25,
                  width: 150,
                  child: Column(
                    children: [
                      Container(
                          constraints: BoxConstraints(
                              minHeight: 46),
                          child: Text(
                        nombresMenuPlato[i],
                        style: TextStyle(fontSize: 20, color: primaryGreen),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bs 30",
                            style: TextStyle(fontSize: 16, color: primaryBlack),
                          ),
                          RaisedButton(
                            textColor: Colors.white,
                            color: primaryGreenLight,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            onPressed: () {},
                            child: Text('Ver', style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      banners.add(bannerView);
    }
    //PageController controller =
    //    PageController(viewportFraction: 0.6, initialPage: 0);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: banners,
      ),
    );
  }
}
