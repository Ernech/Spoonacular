import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/src/models/meal_diet_model.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';
import 'package:spoonacular/utils/utils.dart' as utils;
import '../../constants.dart';

class BannerMeal extends StatelessWidget {
  final List<Meal> meals;
  final prefs = PreferenciasUsuario();
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
                )),
          ),
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
                        constraints:
                            BoxConstraints(maxWidth: 150, minHeight: 46),
                        child: _crearTexto(prefs, meals[i].title)),
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
                    Navigator.pushNamed(context, '/mealInformation',
                        arguments: <String, dynamic>{
                          'id': meals[i].id,
                          'meal': meals[i]
                        });
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/mealInformation',
                          arguments: <String, dynamic>{
                            'id': meals[i].id,
                            'meal': meals[i]
                          });
                    },
                    child: Text(
                      prefs.idioma == 0 ? 'View' : 'Ver',
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

  Widget _crearTexto(PreferenciasUsuario prefs, String title) {
    switch (prefs.idioma) {
      case 0:
        return Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: primaryGreen,
          ),
          textAlign: TextAlign.left,
        );
        break;
      case 1:
        return FutureBuilder(
          future: utils.traducirAEs(title),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return Text(
                snapshot.data,
                style: TextStyle(
                  fontSize: 16,
                  color: primaryGreen,
                ),
                textAlign: TextAlign.left,
              );
            }
          },
        );
        break;
      default:
        return Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: primaryGreen,
          ),
          textAlign: TextAlign.left,
        );
    }
  }

  Widget _crearImagen(String url, BuildContext context) {
    if (url == null || url == '') {
      return Image(
        image: AssetImage('images/no-image.png'),
        height: 100.0,
        width: 100.0,
      );
    } else {
      return CachedNetworkImage(
          imageUrl: url,
          height: 100.0,
          width: 100.0,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Image.asset(
                'images/no-image.png',
                height: 100.0,
                width: 100.0,
              ));
    }
  }
}
