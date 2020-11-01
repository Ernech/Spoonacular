import 'dart:convert';

import 'package:spoonacular/src/models/menu_item_detail_model.dart';
import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class SpoonacularProvider {
  //696885e454824daf899c0ffe18b58bff vania
  String _apiKey = '696885e454824daf899c0ffe18b58bff';
  String _url = 'api.spoonacular.com';

  Future<List<MenuItem>> getMenuItems(String query) async {
    final translator = GoogleTranslator();
    var translation = await translator.translate(query, from: 'es', to: 'en');
    String texto = translation.toString();
    final urlEndpoint = Uri.https(
        _url, 'food/menuItems/search', {'query': texto, 'apiKey': _apiKey});
    final respuesta = await http.get(urlEndpoint);
    final decodedData = json.decode(respuesta.body);
    print(decodedData);
    //return [];
    final menuItems = new MenuItems.fromJsonList(decodedData['menuItems']);
    return menuItems.items;
  }

  Future<MenuItemDetail> getMenuItemDetail(int idMenuItem) async {
    final urlEndpoint =
        Uri.https(_url, 'food/menuItems/$idMenuItem', {'apiKey': _apiKey});
    final respuesta = await http.get(urlEndpoint);
    final decodedData = json.decode(respuesta.body);
    print(decodedData);
    final menuItemDetail = new MenuItemDetail.fromJSONMap(decodedData);
    return menuItemDetail;
  }
}
