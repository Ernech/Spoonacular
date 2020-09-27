import 'package:flutter/material.dart';
import 'package:spoonacular/src/widgets/banner_widget_area.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage>
    with SingleTickerProviderStateMixin {
  final _buscador = TextEditingController();
  var iconsImages = [
    "images/icon-vegetarian.png",
    "images/icon-vegan.png",
    "images/icon-omnivoro.png",
    "images/icon-no-gluten.png",
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
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
              Padding(
                padding: const EdgeInsets.fromLTRB(36, 36, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Nutrana",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Pacifico",
                          color: Color(0xFF5B8C2A),
                          letterSpacing: 5.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                padding: EdgeInsets.symmetric(horizontal: 30,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      color: Colors.white,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "Restaurantes , plato y dietas",
                      hintStyle: TextStyle(color: Colors.grey),
                      ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(36, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Restaurantes",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              BannerWidgetArea(),
              Padding(
                padding: const EdgeInsets.fromLTRB(36, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Estilo de Vida",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.bold),
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
              _tarjetas()
              // Row(
              //   children: [
              //     Column(
              //       children: [
              //         _tarjetasEstiloDeVida("vegetarian", "Vegetariano",
              //             iconsImages[0], Colors.green),
              //         _tarjetasEstiloDeVida("Omnivoro", "Omnivoro",
              //             iconsImages[2], Colors.deepOrangeAccent),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         _tarjetasEstiloDeVida("vegano", "Vegano", iconsImages[1],
              //             Colors.lightGreen),
              //         _tarjetasEstiloDeVida("No gluten", "No gluten",
              //             iconsImages[3], Colors.grey),
              //       ],
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _tarjetasEstiloDeVida(String tag, String texto, String image,
      Color color) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(36, 10, 10, 10),
          child: Container(
            width: (MediaQuery
                .of(context)
                .size
                .width) / 2.55,
            height: 115,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
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
                        tag: tag,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(image),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  texto,
                  style:
                  TextStyle(fontSize: 16, fontFamily: "Muli", color: color),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tarjetas() {
    return Table(
      children: [
        TableRow(children: [
          _tarjetasEstiloDeVida(
              "vegetarian", "Vegetariano", iconsImages[0], Colors.green),
          _tarjetasEstiloDeVida(
              "Omnivoro", "Omnivoro", iconsImages[2], Colors.deepOrangeAccent),
        ]),
        TableRow(children: [
          _tarjetasEstiloDeVida(
              "vegano", "Vegano", iconsImages[1], Colors.lightGreen),
          _tarjetasEstiloDeVida(
              "No gluten", "No gluten", iconsImages[3], Colors.grey),
        ])
      ],
    );
  }
}