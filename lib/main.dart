import 'package:flutter/material.dart';
import 'package:spoonacular/src/pages/home_page.dart';
import 'package:spoonacular/src/pages/inicio_page.dart';
import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:spoonacular/src/providers/menu_item_provider.dart';
import 'package:spoonacular/utils/utils.dart' as utils;
import 'package:translator/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

var bannerItems = ["a", "b", "c", "d", "e", "f"];
var bannerImages = [
  "images/aguacate.jpg",
  "images/leckerbrot.jpg",
  "images/lupito.jpg",
  "images/manadeoscileos.jpg",
  "images/ventanita.jpg",
  "images/wellness.jpg"
];

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Nutrana",
                        style: TextStyle(fontSize: 30, fontFamily: "Pacifico"),
                      ),
                    ],
                  ),
                ),
                BannerWidgetArea(),
                _menuItemsTest()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _menuItemsTest,
        child: Icon(Icons.language),
      ),
    );
  }

  Widget _menuItemsTest() {
    MenuItemProvider menuItemProvider = new MenuItemProvider();
    return FutureBuilder(
      future: menuItemProvider.getMenuItems('arroz'),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else {
          List<MenuItem> items = snapshot.data;
          return FutureBuilder(
            future: utils.enToEs(items[1].title),
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                String texto = snapshot.data;
                print('Traducido $texto');
                return Container();
              } else {
                return CircularProgressIndicator();
              }
            },
          );
        }
      },
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < bannerItems.length; i++) {
      var bannerView = Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              bannerImages[i],
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
      banners.add(bannerView);
    }
    PageController controller = PageController(initialPage: 0);
    return Container(
      width: screenWidth,
      height: screenWidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
