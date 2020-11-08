import 'package:flutter/material.dart';

import '../../constants.dart';

class BannerAlimentosPermitidos extends StatelessWidget {
  final bannerVariable = [
    "Legumbres",
    "Cereales",
    "Frutas",
    "Verduras",
    "Frutos Secos",
    "Semillas",
    "Huevos",
    "Lacteos",
    "Miel"
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < bannerVariable.length; i++) {
      var bannerView = Container(
        margin: EdgeInsets.symmetric( horizontal: 10),
        child: Chip(
          label: Text(
              bannerVariable[i],
            style: TextStyle(color: primaryWhite, fontSize: 12),
          ),
          backgroundColor: primaryBrown,
        ),
      );
      banners.add(bannerView);
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          children: banners,
        ),
      ),
    );
  }
}
