import 'package:rxdart/rxdart.dart';
import 'package:spoonacular/src/models/usuario_model.dart';
import 'package:spoonacular/src/providers/usuario_provider.dart';

class UsuarioBloc {
  final _usuarioController = new BehaviorSubject<UsuarioModel>();
  final _cargandoController = new BehaviorSubject<bool>();

  Stream<UsuarioModel> get usuarioStream => _usuarioController.stream;
  Stream<bool> get cargandoStream => _cargandoController.stream;

  final UsuarioProvider _usuarioProvider = new UsuarioProvider();

  void registrarUsuario(UsuarioModel usuarioModel) async {
    _cargandoController.sink.add(true);
    await _usuarioProvider.registrarUsuarioFirebase(usuarioModel);
    _cargandoController.sink.add(false);
  }

  void modificarUsuario(UsuarioModel usuarioModel) async {
    _cargandoController.sink.add(true);
    await _usuarioProvider.modificarUsuarioFirebase(usuarioModel);
    _cargandoController.sink.add(false);
  }

  void cargarUsuarios(String email) async {
    final usuario = await _usuarioProvider.cargarUsuarioFirebase(email);
    _usuarioController.sink.add(usuario);
  }

  dipose() {
    _usuarioController?.close();
    _cargandoController?.close();
  }
}
