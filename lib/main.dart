import 'package:flutter/material.dart';
import 'package:spoonacular/dieta_pagina.dart';

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
var iconsImages = [
  "images/icon-vegetarian.png",
  "images/icon-vegan.png",
  "images/icon-omnivoro.png",
  "images/icon-no-gluten.png",
];
var nombresRestaurantes = [
  "Leckerbrot",
  "Ventanita",
  "Aguacate",
  "Lupito",
  "Mana de los cielos",
  "Wellness food"
];


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(36,36,10,10),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(36,10,10,10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Restaurantes",
                        style: TextStyle(fontSize: 16, fontFamily: "Muli",fontWeight: FontWeight.bold ),
                      ),
                    ],
                  ),
                ),
                BannerWidgetArea(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36,10,10,10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Estilo de Vida",
                        style: TextStyle(fontSize: 16, fontFamily: "Muli",fontWeight: FontWeight.bold ),
                      ),
                    ],
                  ),
                ),
                //Container(
                //  height: MediaQuery.of(context).size.height - 10,
                //  width: double.infinity,
                //  child: TabBarView(
                //    controller: _tabController,
                //    children: [DietaPagina(),DietaPagina(),DietaPagina()],
                //  ),
                //),
                //Container(
                //  child: GridView.count(
                //    crossAxisCount: 2,
                //  children: [
                //    Container(
                //      decoration: BoxDecoration(
                //        color: Colors.red,
                //        borderRadius: BorderRadius.circular(13),
                //      ),
                //    ),
                //  ],),
                //),
                //Container(
                //  height: MediaQuery.of(context).size.height - 10,
                //  width: double.infinity,
                //  child: TabBarView(
                //    controller: _tabController,
                //    children: [
                //      DietaPagina(),
                //      DietaPagina(),
                //      DietaPagina(),
                //    ],
                //  ),
                //),
                Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(36,10,10,10),
                              child: Container(
                                width: (MediaQuery.of(context).size.width) /2.55,
                                height: 115,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3.0,
                                        blurRadius: 5.0
                                    )
                                  ],
                                  
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Hero(
                                            tag: "vegetarian",
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      iconsImages[0]
                                                  ),
                                                    fit:BoxFit.contain
                                                )
                                              ),
                                            ),
                                          )
                                          ,
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Vegetariano",
                                      style: TextStyle(fontSize: 16, fontFamily: "Muli",color: Colors.green ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(36,10,10,10),
                              child: Container(
                                width: (MediaQuery.of(context).size.width) /2.55,
                                height: 115,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3.0,
                                        blurRadius: 5.0
                                    )
                                  ],

                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Hero(
                                            tag: "Omnivoro",
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          iconsImages[2]
                                                      ),
                                                      fit:BoxFit.contain
                                                  )
                                              ),
                                            ),
                                          )
                                          ,
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Omnivoro",
                                      style: TextStyle(fontSize: 16, fontFamily: "Muli",color: Colors.deepOrangeAccent ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,10,36,10),
                              child: Container(
                                width: (MediaQuery.of(context).size.width) /2.55,
                                height: 115,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3.0,
                                        blurRadius: 5.0
                                    )
                                  ],

                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Hero(
                                            tag: "vegano",
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          iconsImages[1]
                                                      ),
                                                      fit:BoxFit.contain
                                                  )
                                              ),
                                            ),
                                          )
                                          ,
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Vegano",
                                      style: TextStyle(fontSize: 16, fontFamily: "Muli",color: Colors.lightGreen ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,10,36,10),
                              child: Container(
                                width: (MediaQuery.of(context).size.width) /2.55,
                                height: 115,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3.0,
                                        blurRadius: 5.0
                                    )
                                  ],

                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Hero(
                                            tag: "No gluten",
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          iconsImages[3]
                                                      ),
                                                      fit:BoxFit.contain
                                                  )
                                              ),
                                            ),
                                          )
                                          ,
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "No gluten",
                                      style: TextStyle(fontSize: 16, fontFamily: "Muli",color: Colors.grey ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
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
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: new AssetImage(
                        bannerImages[i],
                      ),
                      fit: BoxFit.cover,
                    ),),
              ),
              SizedBox(height: 15),
              Text(nombresRestaurantes[i] , style: TextStyle(fontSize: 16, fontFamily: "Muli",fontWeight: FontWeight.bold,color: Colors.grey),),
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
    //PageController controller =
    //    PageController(viewportFraction: 0.6, initialPage: 0);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(26,0,26,0),
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
