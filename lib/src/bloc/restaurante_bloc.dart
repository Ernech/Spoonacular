import 'package:rxdart/rxdart.dart';
import 'package:spoonacular/src/models/restaurante_model.dart';
import 'package:spoonacular/src/providers/restaurante_provider.dart';

class RestauranteBloc {
  final _restauranteController = new BehaviorSubject<List<RestauranteModel>>();

  final RestauranteProvider restauranteProvider = new RestauranteProvider();

  Stream<List<RestauranteModel>> get restauranteStream =>
      _restauranteController.stream;

  void obtenerRestaurantes() async {
    final restaurantes = await restauranteProvider.obtenerRestaurantes();
    _restauranteController.sink.add(restaurantes);
  }

  dipose() {
    _restauranteController?.close();
  }
}
