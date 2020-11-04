import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:spoonacular/src/bloc/register_validators.dart';

class RegisterBloc with RegisterValidators {
  final _usernameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar datos del stream
  Stream<String> get usernameStream =>
      _usernameController.stream.transform(validarUsername);
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => Rx.combineLatest3(usernameStream,
      emailStream, passwordStream, (username, email, password) => true);

  //Insertar valores al stream
  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener el último valor ingresado de los streams
  String get username => _usernameController.value;
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _usernameController?.close();
    _emailController?.close();
    _passwordController?.close();
  }
}
