import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spoonacular/src/models/usuario_model.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';

class UsuarioProvider {
  final String _fireBaseToken = 'AIzaSyA_ej00DpuzNDqoIhU3PtLye2XkeJ9jpR0';
  final _prefs = PreferenciasUsuario();
  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_fireBaseToken',
        body: jsonEncode(authData));
    Map<String, dynamic> decodeResp = jsonDecode(resp.body);
    print('Respuesta: $decodeResp');
    if (decodeResp.containsKey('idToken')) {
      _prefs.token = decodeResp['idToken'];
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuatio(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_fireBaseToken',
        body: jsonEncode(authData));
    Map<String, dynamic> decodeResp = jsonDecode(resp.body);
    print('Respuesta: $decodeResp');
    if (decodeResp.containsKey('idToken')) {
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }

  Future<bool> registrarUsuarioFirebase(UsuarioModel usuario) async {
    bool state;
    final urlUsuario = 'https://sql-demos-f513d.firebaseio.com/usuarios.json';
    final resp = await http.post(urlUsuario, body: usuarioModelToJson(usuario));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    resp.statusCode == 200 ? state = true : state = false;
    return state;
  }
}
