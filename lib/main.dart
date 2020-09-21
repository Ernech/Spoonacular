import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

var bannerItems = ["a", "b", "c", "d", "e", "f"];
var bannerImages = [
  "images/leckerbrot.jpg",
  "images/ventanita.jpg",
  "images/aguacate.jpg",
  "images/lupito.jpg",
  "images/manadeoscileos.jpg",
  "images/wellness.jpg"
];
var nombresRestaurantes = [
  "leckerbrot",
  "ventanita",
  "aguacate.",
  "ilupito",
  "manadeoscileos",
  "wellness"
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
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
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: new AssetImage(
                        bannerImages[i],
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(height: 15),
              Text(nombresRestaurantes[i]),
            ],
          ),
      );

      //child: Container(
      //  child: Stack(
      //    fit: StackFit.expand,
      //    children: [
      //      ClipRRect(
      //        borderRadius:BorderRadius.all(Radius.circular(10)),
      //        child: Image.asset(
      //          bannerImages[i],
      //          fit: BoxFit.cover,
      //        ),
      //      ),
      //    ],
      //  ),
      //),
      banners.add(bannerView);
    }
    PageController controller =
        PageController(viewportFraction: 0.6, initialPage: 0);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(26,0,0,0),
      scrollDirection: Axis.horizontal,
      child: Row(children: banners,),
      //child: PageView(
      //  controller: controller,
      //  scrollDirection: Axis.horizontal,
      //  children: banners,
      //),
    );
  }
}
