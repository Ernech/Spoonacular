class Restaurantes {
  List<RestauranteModel> restaurantes = new List();
  Restaurantes();
  Restaurantes.fromJSONList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        if (item != null) {
          final restaurante = RestauranteModel.fromJSONMap(item);
          restaurantes.add(restaurante);
        }
      }
    }
  }
}

class RestauranteModel {
  String nombre;
  String url;

  RestauranteModel({this.nombre, this.url});

  RestauranteModel.fromJSONMap(Map<String, dynamic> json) {
    nombre = json['nombre'];
    url = json['url'];
  }
}
