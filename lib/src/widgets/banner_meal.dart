import 'package:flutter/material.dart';
import 'package:spoonacular/src/models/meal_diet_model.dart';
import 'package:spoonacular/utils/utils.dart' as utils;
import '../../constants.dart';

class BannerMeal extends StatelessWidget {
  final List<Meal> meals;

  BannerMeal({@required this.meals});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < meals.length; i++) {
      var bannerView = _crearTarjeta(context, i);
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

  Widget _crearTarjeta(BuildContext context, int i) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 10, bottom: 10),
      height: 265,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: -20,
            child: Container(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: _crearImagen(
                      'https://webknox.com/recipeImages/${meals[i].id}-556x370.${meals[i].imageType}',
                      context),
                )

                // FadeInImage(
                //   placeholder: AssetImage('images/loading-circle.gif'),
                //   image: NetworkImage(menuItems[i].image),
                // ),
                ),
          ),
          // Positioned(
          //   top: 5,
          //   left: 0,
          //   child: Row(
          //     children: [
          //       IconButton(
          //         icon: Icon(Icons.favorite),
          //         color: primaryGreenLight,
          //         onPressed: () {
          //           print("favorito");
          //         },
          //       ),
          //       Text(
          //         "5",
          //         style: TextStyle(color: primaryGreenLight),
          //       ),
          //     ],
          //   ),
          // ),
          Positioned(
            top: 140,
            left: 16,
            width: 150,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 150, minHeight: 46),
                      child:
                          //  FutureBuilder(
                          //   future: utils.traducirAEs(menuItems[i].title),
                          //   initialData: null,
                          //   builder:
                          //       (BuildContext context, AsyncSnapshot snapshot) {
                          //     if (!snapshot.hasData) {
                          //       return CircularProgressIndicator();
                          //     } else {
                          //       return
                          Text(
                        meals[i].title,
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryGreen,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      //     }
                      //   },
                      // ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 210,
            right: 16,
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  textColor: Colors.white,
                  color: primaryGreenLight,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  onPressed: () {
                    print("Container" + i.toString());
                    Navigator.pushNamed(context, '/ingredientes',
                        arguments: <String, dynamic>{
                          'id': meals[i].id,
                          'menuItem': meals[i]
                        });
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/ingredientes',
                          arguments: <String, dynamic>{
                            'id': meals[i].id,
                            'menuItem': meals[i]
                          });
                    },
                    child: Text(
                      'Ver',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearImagen(String url, BuildContext context) {
    if (url == null || url == '') {
      return Image(
        image: AssetImage('images/no-image.png'),
        height: 100.0,
        width: 100.0,
      );
    } else {
      return Image.network(
        url,
        height: 100.0,
        width: 100.0,
        errorBuilder: (context, url, error) => Image(
          image: AssetImage('images/no-image.png'),
          height: 100.0,
          width: 100.0,
        ),
      );
    }
  }
}
