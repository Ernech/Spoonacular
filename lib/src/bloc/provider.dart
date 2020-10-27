import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:spoonacular/src/bloc/spoonacular_bloc.dart';

export 'package:spoonacular/src/bloc/spoonacular_bloc.dart';

class Provider extends InheritedWidget {
  final _spoonacularBloc = new SpoonacularBloc();

  static Provider instanciaActual;

  factory Provider({Key key, Widget child}) {
    if (instanciaActual == null) {
      instanciaActual = new Provider._internal(key: key, child: child);
    }
    return instanciaActual;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SpoonacularBloc spoonacularBloc(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Provider>()
        ._spoonacularBloc;
  }
}
