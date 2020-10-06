import 'dart:convert';

import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class MenuItemProvider {
  String _apiKey = '0409316eb2644d86a23e7fdce0bdeb81';
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
}
