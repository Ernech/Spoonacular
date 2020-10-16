import 'package:flutter/material.dart';
import 'package:spoonacular/src/bloc/provider.dart';
import 'package:spoonacular/src/models/menu_item_detail_model.dart';
import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:spoonacular/src/pages/home_page.dart';
import 'package:spoonacular/src/pages/ingredientes_page.dart';
import 'package:spoonacular/src/pages/restaurante_menu.dart';
import 'package:spoonacular/src/providers/spoonacular_provider.dart';
import 'package:spoonacular/utils/utils.dart' as utils;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final mapp = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'ingredientes': (BuildContext context) => IngredientesPage(),
        'menu': (BuildContext context) => RestauranteMenuPage(),
      },
    );
    return Provider(
      child: mapp,
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
                _menuItemsTest(),
                _menuItemDetail(424571)
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
    SpoonacularProvider spoonacularProvider = new SpoonacularProvider();
    return FutureBuilder(
      future: spoonacularProvider.getMenuItems('tomate'),
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

Widget _menuItemDetail(int id) {
  SpoonacularProvider spoonacularProvider = new SpoonacularProvider();
  return FutureBuilder(
    future: spoonacularProvider.getMenuItemDetail(id),
    initialData: null,
    builder: (BuildContext context, AsyncSnapshot<MenuItemDetail> snapshot) {
      if (snapshot.hasData) {
        MenuItemDetail menuItemDetail = snapshot.data;
        print(menuItemDetail);
        List<Nutrients> nutrients = menuItemDetail
            .obtenerNutrientes(menuItemDetail.nutrition['nutrients']);
        print('NUTRIENTES ${nutrients[1].amount}');
        final caloricBreakdown = menuItemDetail.obtenerCaloricBreakdown(
            menuItemDetail.nutrition['caloricBreakdown']);
        print('CALORIC ${caloricBreakdown.percentCarbs}');

        return Container();
      } else {
        return CircularProgressIndicator();
      }
    },
  );
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
