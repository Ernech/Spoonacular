import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/src/models/usuario_model.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;

String texto = '';

Future<String> enToEs(String query) async {
  await _traducirEnToEs(query);
  return texto;
}

Future<String> traducirAEs(String query) async {
  String _url =
      'https://microsoft-translator-text.p.rapidapi.com/translate?to=es&api-version=3.0&from=en&profanityAction=NoAction&textType=plain';

  List<Map<String, String>> body = [
    {'Text': query}
  ];
  final resp = await http.post(_url,
      headers: {
        "content-type": "application/json",
        "x-rapidapi-key": "0f95bb87f6msh5a6d8119a0afd08p11274ajsn7ca40e882b4f",
        "x-rapidapi-host": "microsoft-translator-text.p.rapidapi.com",
        "useQueryString": 'true'
      },
      body: json.encode(body));

  final decodedData = json.decode(resp.body);

  return decodedData[0]['translations'][0]['text'];
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

void mostarAlertaLogin(
    BuildContext context, String titulo, String mensaje, int idioma) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(_textoMensaje(mensaje, idioma)),
          actions: [
            FlatButton(
                onPressed: () => Navigator.of(context).pop(), child: Text('ok'))
          ],
        );
      });
}

String _textoMensaje(String mensaje, int idioma) {
  if (idioma == 0) {
    if (mensaje == 'INVALID_PASSWORD') {
      return 'Invalid Password';
    } else if (mensaje == 'EMAIL_NOT_FOUND') {
      return 'Email Not Found';
    } else {
      return 'Wrong credentials';
    }
  } else {
    if (mensaje == 'INVALID_PASSWORD') {
      return 'Contraseña Incorrecta';
    } else if (mensaje == 'EMAIL_NOT_FOUND') {
      return 'Email no encontrado';
    } else {
      return 'Datos Incorrectos';
    }
  }
}

//Estilos de vida
Map<String, dynamic> vegetariano = {
  'titulo': 'Vegetariano',
  'imagen': 'images/vegetarian.jpg',
  'diet': 'vegetarian',
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
  'diet': '',
  'descripcion':
      'Una mezcla de carne, pescado, frutas, verduras, cereales, etc. Puede ser saludable si sigue una dieta equilibrada de alimentos integrales o la llamada "alimentación limpia" o no saludable si sigue la dieta estadounidense estándar.',
  'permitidos':
      '¡Todo! Carne, pescado, cereales (salvo casos especiales), huevos, lácteos, frutos secos, semillas, hortalizas, frutas, etc.',
  'noPermitidos': 'Ningun alimento está prohibido'
};
Map<String, dynamic> vegano = {
  'titulo': 'Vegano',
  'imagen': 'images/vegan.jpg',
  'diet': 'vegan',
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
  'diet': 'gluten free',
  'descripcion':
      'Seguir una dieta sin gluten significa eliminar el gluten, las proteínas que se encuentran en el trigo y algunos otros granos. No hay otros requisitos, por lo que una dieta libre de gluten no es necesariamente una dieta saludable, ya que podría cargar fácilmente pasta, galletas y galletas saladas sin gluten. Esta es la razón por la que una dieta libre de gluten tiene más sentido si realmente tiene alergia o insensibilidad al gluten, o si elimina el gluten mientras centra su dieta en alimentos no procesados.',
  'permitidos': 'Cualquier alimento que no contenga gluten',
  'noPermitidos':
      'Granos que contienen gluten, como trigo, cebada y centeno, así como cualquier alimento elaborado con ellos'
};
//Estilos de vida inglés
Map<String, dynamic> vegetarianoEn = {
  'titulo': 'Vegetarian',
  'imagen': 'images/vegetarian.jpg',
  'diet': 'vegetarian',
  'descripcion':
      'This diet excludes all meat, fish, and animal by-products that require the animal to be killed (such as broth made from bones or gelatin). It is typically rich in legumes (e.g. beans and lentils), grains, fruits, vegetables, nuts, and seeds. Vegetarians who eat eggs but not dairy are known as ovo vegetarians while vegetarians who eat dairy but not eggs are known as lacto vegetarians.',
  'permitidos': [
    "Legumes",
    "Grains",
    "Fruits",
    "Vegetables",
    "Nuts",
    "Seeds",
    "Eggs",
    "Dairy",
    "Honey"
  ],
  'noPermitidos': [
    "Meat",
    "Seafood",
    "Bone broth",
    "Gelatin",
  ]
};
Map<String, dynamic> omnivoroEn = {
  'titulo': 'Omnivore',
  'imagen': 'images/omnivore.jpg',
  'diet': '',
  'descripcion':
      'A mixture of meat, fish, fruit, vegetables, grains, etc. It can be healthy if following a balanced whole food or so-called "clean eating" diet1 or unhealthy if eating the Standard American Diet.',
  'permitidos':
      'Everything! Meat, fish, grains (except in special cases), eggs, dairy, nuts, seeds, vegetables, fruit, etc',
  'noPermitidos': 'N/A'
};
Map<String, dynamic> veganoEn = {
  'titulo': 'Vegan',
  'imagen': 'images/vegan.jpg',
  'diet': 'vegan',
  'descripcion':
      'This diet excludes all animal products, including meat, fish, dairy, eggs, and honey. Like the vegetarian diet, the vegan diet is centered around legumes, grains, fruits, vegetables, nuts, and seeds.',
  'permitidos': [
    "Legumes",
    "Grains",
    "Fruits",
    "Vegetables",
    "Nuts",
    "Seeds",
  ],
  'noPermitidos': [
    "Meat",
    "Seafood",
    "Bone broth",
    "Gelatin",
    "Eggs",
    "Dairy",
    "Honey"
  ]
};

Map<String, dynamic> freeGlutenEn = {
  'titulo': 'Gluten Free',
  'imagen': 'images/freegluten.jpg',
  'diet': 'gluten free',
  'descripcion':
      'Following a gluten free diet means eliminating gluten, the proteins found in wheat and some other grains. There are no other requirements, so a gluten free diet is not necessarily a healthy diet, since you could easily load up on gluten free pasta, cookies, and crackers. This is why a gluten free diet mostly makes sense if you truly have a gluten allergy or insensitivity, or if you cut out gluten while centering your diet around unprocessed foods.',
  'permitidos': "Everything that doesn't contain gluten",
  'noPermitidos':
      'Gluten-containing grains, such as wheat, barley, and rye, as well as any foods made from them.'
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
List<Map<String, String>> nutrientesImportantesEn = [
  {
    'tipo': 'Calories',
    'cantidad': '2000',
    'concepto':
        'The calorie is a unit of energy. In nutrition, when it comes to calories, it refers to the energy that people obtain from the food and beverages they consume, and the energy that our own body uses in physical activity.'
  },
  {
    'tipo': 'Fat',
    'cantidad': '44 - 76 g',
    'concepto':
        'Fats are nutrients that the food we eat contains and that our bodies use to build cell membranes, nervous tissue (such as the brain), and hormones.'
  },
  {
    'tipo': 'Proteins',
    'cantidad': '50 a 175 g',
    'concepto':
        'Proteins are essential macronutrients that we acquire through food and that fulfill important functions for the proper functioning of the body, fats or carbohydrates.'
  },
  {
    'tipo': 'Carbohydrates',
    'cantidad': '120-130 g',
    'concepto':
        'Carbohydrates provide fuel for the central nervous system and energy for muscles.'
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
