import 'dart:convert';

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class Usuarios {
  List<UsuarioModel> items = new List();
  Usuarios();
  Usuarios.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final usuario = new UsuarioModel.fromJSONMap(item);
        items.add(usuario);
      }
    }
  }
}

class UsuarioModel {
  String id;
  String firstName;
  String lastNameP;
  String lastNameM;
  String email;
  String username;
  String hash;
  UsuarioModel(
      {this.id,
      this.firstName,
      this.lastNameP,
      this.lastNameM,
      this.email,
      this.username,
      this.hash});

  UsuarioModel.fromJSONMap(Map<String, String> jsonResponse) {
    id = jsonResponse['id'];
    username = jsonResponse['username'];
    firstName = jsonResponse['firstName'];
    lastNameP = jsonResponse['lastNameP'];
    lastNameM = jsonResponse['lastNameM'];
    email = jsonResponse['email'];
    hash = jsonResponse['hash'];
  }

  Map<String, String> toJson() => {
        'username': username,
        'firstName': firstName,
        'lastNameP': lastNameP,
        'lastNameM': lastNameM,
        'email': email,
        'hash': hash
      };
}
