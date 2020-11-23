import 'dart:convert';

import 'package:spoonacular/src/models/ingredients_model.dart';
import 'package:spoonacular/src/models/meal_diet_model.dart';
import 'package:spoonacular/src/models/menu_item_detail_model.dart';
import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class SpoonacularProvider {
  //696885e454824daf899c0ffe18b58bff vania
  //0409316eb2644d86a23e7fdce0bdeb81 ernesto
  //4aa0c9982fad4ced95bb848e4f7870af ariel
  String _apiKey = '0409316eb2644d86a23e7fdce0bdeb81';
  String _url = 'api.spoonacular.com';

  Future<List<MenuItem>> getMenuItems(String query, bool traducir) async {
    String texto = '';
    if (!traducir) {
      texto = query;
    } else {
      final translator = GoogleTranslator();
      var translation = await translator.translate(query, from: 'es', to: 'en');
      texto = translation.toString();
    }

    final urlEndpoint = Uri.https(
        _url, 'food/menuItems/search', {'query': texto, 'apiKey': _apiKey});
    final respuesta = await http.get(urlEndpoint);
    final decodedData = json.decode(respuesta.body);
    print(decodedData);
    //return [];
    final menuItems = new MenuItems.fromJsonList(decodedData['menuItems']);
    return menuItems.items;
  }

  Future<List<MenuItem>> getMenuItemsSecu(
      String query, bool traducir, int offset) async {
    String texto = '';
    if (!traducir) {
      texto = query;
    } else {
      final translator = GoogleTranslator();
      var translation = await translator.translate(query, from: 'es', to: 'en');
      texto = translation.toString();
    }
    print(offset);
    final urlEndpoint = Uri.https(_url, 'food/menuItems/search',
        {'query': texto, 'apiKey': _apiKey, 'offset': offset.toString()});
    final respuesta = await http.get(urlEndpoint);
    final decodedData = json.decode(respuesta.body);
    print('SECU: $decodedData');
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

  Future<List<Ingredient>> getIngredientes(int idRecipe) async {
    final urlEndpoint = Uri.https(
        _url, 'recipes/$idRecipe/ingredientWidget.json', {'apiKey': _apiKey});
    final respuesta = await http.get(urlEndpoint);
    final decodedData = json.decode(respuesta.body);
    //print('Decoded ingredientes: ${decodedData['ingredients']}');
    final ingredientes = Ingredients.fromJSONList(decodedData['ingredients']);
    return ingredientes.items;
  }

  Future<Map<String, dynamic>> registroSpoonacular(String firstName,
      String lastNameP, String lastNameM, String email) async {
    final jsonBody = json.encode({
      'firstName': firstName,
      'lastNameP': lastNameP,
      'lastNameM': lastNameM,
      'email': email
    });
    final urlEndpoint = Uri.https(_url, 'users/connect', {'apiKey': _apiKey});
    final resp = await http.post(urlEndpoint,
        headers: {'Content-type': 'application/json'}, body: jsonBody);
    print(resp.statusCode);

    final decodedData = json.decode(resp.body);

    return {
      'status': resp.statusCode,
      'username': decodedData['username'],
      'firstName': firstName,
      'lastNameP': lastNameP,
      'lastNameM': lastNameM,
      'email': email,
      'hash': decodedData['hash']
    };
  }

  Future<List<Meal>> generateMealPlanning(String diet) async {
    final urlEndpoint = Uri.https(_url, 'mealplanner/generate',
        {'apiKey': _apiKey, 'diet': diet, 'timeFrame': 'day'});
    final respuesta = await http.get(urlEndpoint);
    final decodedData = json.decode(respuesta.body);
    //print('Decoded ingredientes: ${decodedData['ingredients']}');
    final mealItems = MealItems.fromJSONList(decodedData['meals']);
    return mealItems.items;
  }

  Future<RecipeNutrition> getRecipeNUtrition(int id) async {
    final urlEndpoint = Uri.https(_url, 'recipes/$id/nutritionWidget.json',
        {'apiKey': _apiKey});
    final respuesta = await http.get(urlEndpoint);
    final decodedData = json.decode(respuesta.body);
    //print('Decoded ingredientes: ${decodedData['ingredients']}');
    final recipeNutrition = RecipeNutririon.fromJSONMap(decodedData);
    return recipeNutrition;
  }
}
