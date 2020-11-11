import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:spoonacular/src/bloc/login_bloc.dart';
import 'package:spoonacular/src/bloc/register_bloc.dart';
import 'package:spoonacular/src/bloc/restaurante_bloc.dart';
import 'package:spoonacular/src/bloc/spoonacular_bloc.dart';
import 'package:spoonacular/src/bloc/usuario_bloc.dart';

export 'package:spoonacular/src/bloc/spoonacular_bloc.dart';
export 'package:spoonacular/utils/utils.dart';
export 'package:spoonacular/src/bloc/restaurante_bloc.dart';
export 'package:spoonacular/src/bloc/usuario_bloc.dart';
export 'package:spoonacular/src/bloc/register_bloc.dart';

class Provider extends InheritedWidget {
  final loginBloc = new LoginBloc();
  final _registerBloc = new RegisterBloc();
  final _spoonacularBloc = new SpoonacularBloc();
  final _restauranteBloc = new RestauranteBloc();
  final _usuarioBloc = new UsuarioBloc();

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

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  static RegisterBloc registerBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._registerBloc;
  }

  static SpoonacularBloc spoonacularBloc(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Provider>()
        ._spoonacularBloc;
  }

  static RestauranteBloc restauranteBloc(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Provider>()
        ._restauranteBloc;
  }

  static UsuarioBloc usuarioBLoc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._usuarioBloc;
  }
}
