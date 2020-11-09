import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spoonacular/src/models/restaurante_model.dart';

class RestauranteProvider {
  final String _url =
      'https://spoonacular-6881b.firebaseio.com/restaurantes.json';

  Future<List<RestauranteModel>> obtenerRestaurantes() async {
    final respuesta = await http.get(_url);
    final decodedData = json.decode(respuesta.body);
    final restaurantes = Restaurantes.fromJSONList(decodedData);
    return restaurantes.restaurantes;
  }
}
