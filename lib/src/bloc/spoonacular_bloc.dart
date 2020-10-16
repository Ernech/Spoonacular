import 'dart:io';
import 'package:rxdart/rxdart.dart';
import 'package:spoonacular/src/models/menu_item_detail_model.dart';
import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:spoonacular/src/providers/spoonacular_provider.dart';

class SpoonacularBloc {
  final _menuItemController = new BehaviorSubject<List<MenuItem>>();
  final _menuItemDetailController = new BehaviorSubject<MenuItemDetail>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _spoonacularProvider = new SpoonacularProvider();

  Stream<List<MenuItem>> get menuItemsStream => _menuItemController.stream;
  Stream<MenuItemDetail> get menuItemDetailStream =>
      _menuItemDetailController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarMenuItems(String query) async {
    final menuItems = await _spoonacularProvider.getMenuItems(query);
    _menuItemController.sink.add(menuItems);
  }

  void cargarMenuItemDetail(int id) async {
    final menuItemDetail = await _spoonacularProvider.getMenuItemDetail(id);
    _menuItemDetailController.sink.add(menuItemDetail);
  }

  dipose() {
    _menuItemController?.close();
    _menuItemDetailController?.close();
    _cargandoController?.close();
  }
}
