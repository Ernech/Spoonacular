import 'package:rxdart/rxdart.dart';
import 'package:spoonacular/utils/utils.dart' as utils;

class GoogleTranslateBloc {
  final _enToEsController = new BehaviorSubject<String>();

  Stream<String> get enToEsStream => _enToEsController.stream;

  void traducirEnToEs(String query) async {
    final texto = await utils.enToEs(query);
    _enToEsController.sink.add(texto);
  }

  dipose() {
    _enToEsController?.close();
  }
}
