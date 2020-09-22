import 'package:flutter/material.dart';
class DietaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: [
          SizedBox(height: 15.0,),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 20.0,
            child: GridView.count(
              crossAxisCount:2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: [
                _buildCard("Vegatariano", "",context),
                _buildCard("Vegano", "",context),
                _buildCard("Omnivoro", "",context),
                _buildCard("No gluten", "",context),
              ],
            ),
          ),
        ],
      ),
      
    );
  }
  Widget _buildCard(String nombreDieta , String imagePath ,context){
    return Padding(
      padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 5.0,right: 5.0),
    child: InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0
            )
          ],
          color: Colors.white,
        ),
      ),
    ),);
  }
}
