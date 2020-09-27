import 'package:flutter/material.dart';

class BannerWidgetArea extends StatelessWidget {
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
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < bannerItems.length; i++) {
      var bannerView = Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: new AssetImage(
                    bannerImages[i],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              nombresRestaurantes[i],
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Muli",
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
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
