
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
  String firstName;
  String lastName;
  String email;
  String username;
  String hash;
  UsuarioModel(
      this.firstName, this.lastName, this.email, this.username, this.hash);

  UsuarioModel.fromJSONMap(Map<String, String> jsonResponse) {
    username = jsonResponse['username'];
    firstName = jsonResponse['firstName'];
    lastName = jsonResponse['lastName'];
    email = jsonResponse['email'];
    hash = jsonResponse['hash'];
  }
  UsuarioModel obtenerUsuario(List<UsuarioModel> usuarios, String email) {
    UsuarioModel usuario;
    for (int i = 0; i < usuarios.length; i++) {
      if (usuario.email == email) {
        usuario = usuarios[i];
        break;
      }
    }
    return usuario;
  }

  Map<String, String> toJson() => {
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'hash': hash
      };
}
