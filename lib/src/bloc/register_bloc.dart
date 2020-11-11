import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:spoonacular/src/bloc/register_validators.dart';

class RegisterBloc with RegisterValidators {
  final _nameController = BehaviorSubject<String>();
  final _apPaternoController = BehaviorSubject<String>();
  final _apMaternoController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar datos del stream
  Stream<String> get usernameStream =>
      _nameController.stream.transform(validarNombre);
  Stream<String> get apPaternoStream =>
      _apPaternoController.stream.transform(validarApPaterno);
  Stream<String> get apMaternoStream =>
      _apMaternoController.stream.transform(validarApMaterno);
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get registerFormValidStream => Rx.combineLatest5(
      usernameStream,
      apPaternoStream,
      apMaternoStream,
      emailStream,
      passwordStream,
      (username, apPaterno, apMaterno, email, password) => true);

  //Insertar valores al stream
  Function(String) get changeUsername => _nameController.sink.add;
  Function(String) get changeApPaterno => _apPaternoController.sink.add;
  Function(String) get changeApMaterno => _apMaternoController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener el último valor ingresado de los streams
  String get username => _nameController.value;
  String get apPaterno => _apPaternoController.value;
  String get apMaterno => _apMaternoController.value;
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _nameController?.close();
    _apMaternoController?.close();
    _apPaternoController?.close();
    _emailController?.close();
    _passwordController?.close();
  }
}
