import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/src/models/usuario_model.dart';
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

void mostarAlerta(BuildContext context, String titulo, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensaje),
          actions: [
            FlatButton(
                onPressed: () => Navigator.of(context).pop(), child: Text('ok'))
          ],
        );
      });
}

//Estilos de vida
Map<String, dynamic> vegetariano = {
  'titulo': 'Vegetariano',
  'imagen': 'images/vegetarian.jpg',
  'descripcion':
      'Esta dieta excluye toda la carne, el pescado y los subproductos animales que requieren la muerte del animal (como el caldo elaborado con huesos o gelatina). Por lo general, es rico en legumbres (por ejemplo, frijoles y lentejas), granos, frutas, verduras, nueces y semillas. Los vegetarianos que comen huevos pero no lácteos se conocen como ovo vegetarianos, mientras que los vegetarianos que comen lácteos pero no huevos se conocen como lacto vegetarianos.',
  'permitidos': [
    "Legumbres",
    "Cereales",
    "Frutas",
    "Verduras",
    "Frutos Secos",
    "Semillas",
    "Huevos",
    "Lacteos",
    "Miel"
  ],
  'noPermitidos': [
    "Carne",
    "Mariscos",
    "Caldo de hueso",
    "Gelatina",
  ]
};
Map<String, dynamic> omnivoro = {
  'titulo': 'Omnivoro',
  'imagen': 'images/omnivore.jpg',
  'descripcion':
      'Una mezcla de carne, pescado, frutas, verduras, cereales, etc. Puede ser saludable si sigue una dieta equilibrada de alimentos integrales o la llamada "alimentación limpia" o no saludable si sigue la dieta estadounidense estándar.',
  'permitidos':
      '¡Todo! Carne, pescado, cereales (salvo casos especiales), huevos, lácteos, frutos secos, semillas, hortalizas, frutas, etc.',
  'noPermitidos': 'Ningun alimento está prohibido'
};
Map<String, dynamic> vegano = {
  'titulo': 'Vegano',
  'imagen': 'images/vegan.jpg',
  'descripcion':
      'Esta dieta excluye todos los productos animales, incluida la carne, el pescado, los lácteos, los huevos y la miel. Al igual que la dieta vegetariana, la dieta vegana se centra en legumbres, cereales, frutas, verduras, frutos secos y semillas.',
  'permitidos': [
    "Legumbres",
    "Granos",
    "Frutas",
    "Verduras",
    "Nueces",
    "Semillas",
  ],
  'noPermitidos': [
    "Carne",
    "Mariscos",
    "Caldo de hueso",
    "Gelatina",
    "Huevos",
    "Productos Lácteos",
    "Miel"
  ]
};

Map<String, dynamic> freeGluten = {
  'titulo': 'No Gluten',
  'imagen': 'images/freegluten.jpg',
  'descripcion':
      'Seguir una dieta sin gluten significa eliminar el gluten, las proteínas que se encuentran en el trigo y algunos otros granos. No hay otros requisitos, por lo que una dieta libre de gluten no es necesariamente una dieta saludable, ya que podría cargar fácilmente pasta, galletas y galletas saladas sin gluten. Esta es la razón por la que una dieta libre de gluten tiene más sentido si realmente tiene alergia o insensibilidad al gluten, o si elimina el gluten mientras centra su dieta en alimentos no procesados.',
  'permitidos': 'Cualquier alimento que no contenga gluten',
  'noPermitidos':
      'Granos que contienen gluten, como trigo, cebada y centeno, así como cualquier alimento elaborado con ellos'
};

// Nutrientes Importantes
List<Map<String, String>> nutrientesImportantes = [
  {
    'tipo': 'Calorias',
    'cantidad': '2000',
    'concepto':
        'La caloría es una unidad de energía. En nutrición, cuando se habla de calorías se refiere a la energía que las personas obtienen de los alimentos y bebidas que consumen, y la energía que usa nuestro propio cuerpo en la actividad física.'
  },
  {
    'tipo': 'Grasa',
    'cantidad': '44 - 76 g',
    'concepto':
        'Las grasas son nutrientes que contienen los alimentos que ingerimos y que utiliza nuestro cuerpo para construir membranas celulares, tejido nervioso (como el cerebro) y hormonas'
  },
  {
    'tipo': 'Proteinas',
    'cantidad': '50 a 175 gramos',
    'concepto':
        'Las proteínas son macronutrientes esenciales que adquirimos a través de los alimentos y que cumplen funciones importantes para el buen funcionamiento del organismo grasas o hidratos de carbono.'
  },
  {
    'tipo': 'Carbohidratos',
    'cantidad': '120-130 gramos',
    'concepto':
        'Los carbohidratos proporcionan el combustible para el sistema nervioso central y la energía para los músculos.'
  }
];
Map<String, dynamic> parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
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

bool validarDatosUsuario(String username, String lastNameP, String lastNameM) {
  if ((username.length == 0 || username == '') ||
      (lastNameP.length == 0 || lastNameP == '') ||
      (lastNameM.length == 0 || lastNameM == '')) {
    return false;
  } else {
    return true;
  }
}

bool validarEmail(String email) {
  Pattern pattern =
      r'^[a-zA-Z0-9.!#$%&+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$';
  //Pattern pattern = r'^(([^<>()[]\.,;:\s@"]+(.[^<>()[]\.,;:\s@"]+)*)|(".+"))@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z-0-9]+.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (regExp.hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}

bool validarPassword(String pass) {
  if (pass.length > 1 && pass.length < 6) {
    return false;
  } else {
    return true;
  }
}
