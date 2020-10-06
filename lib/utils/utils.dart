import 'package:translator/translator.dart';

String texto = '';

Future<String> enToEs(String query) async {
  await _traducirEnToEs(query);
  return texto;
}

String esToEn(String query) {
  _traducirEsToEn(query);
  return texto;
}

_traducirEnToEs(String text) async {
  final translator = GoogleTranslator();
  var translation = await translator.translate(text, from: 'en', to: 'es');
  texto = translation.toString();
}

Future<String> _traducirEsToEn(String text) async {
  final translator = GoogleTranslator();
  var translation = await translator.translate(text, from: 'es', to: 'en');
  texto = translation.toString();
}
