import 'package:rxdart/rxdart.dart';
import 'package:spoonacular/src/models/ingredients_model.dart';
import 'package:spoonacular/src/models/meal_diet_model.dart';
import 'package:spoonacular/src/models/menu_item_detail_model.dart';
import 'package:spoonacular/src/models/menu_item_model.dart';
import 'package:spoonacular/src/providers/spoonacular_provider.dart';

class SpoonacularBloc {
  final _menuItemController = new BehaviorSubject<List<MenuItem>>();
  final _menuItemControllerSec = new BehaviorSubject<List<MenuItem>>();
  final _menuItemDetailController = new BehaviorSubject<MenuItemDetail>();
  final _ingredientesController = new BehaviorSubject<List<Ingredient>>();
  final _cargandoController = new BehaviorSubject<bool>();
  final _mealPlanController = new BehaviorSubject<List<Meal>>();
  final _spoonacularProvider = new SpoonacularProvider();

  Stream<List<MenuItem>> get menuItemsStream => _menuItemController.stream;
  Stream<List<MenuItem>> get menuItemsStreamSec =>
      _menuItemControllerSec.stream;
  Stream<MenuItemDetail> get menuItemDetailStream =>
      _menuItemDetailController.stream;
  Stream<List<Ingredient>> get ingredientsStream =>
      _ingredientesController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarMenuItems(String query, bool traducir) async {
    final menuItems = await _spoonacularProvider.getMenuItems(query, traducir);
    _menuItemController.sink.add(menuItems);
  }

  void cargarMenuItemsSecu(String query, bool traducir, int offset) async {
    final menuItems =
        await _spoonacularProvider.getMenuItemsSecu(query, traducir, offset);
    _menuItemControllerSec.sink.add(menuItems);
  }

  void cargarMenuItemDetail(int id) async {
    final menuItemDetail = await _spoonacularProvider.getMenuItemDetail(id);
    _menuItemDetailController.sink.add(menuItemDetail);
  }

  void cargarIngredientes(int id) async {
    final ingredientes = await _spoonacularProvider.getIngredientes(id);
    _ingredientesController.sink.add(ingredientes);
  }

  void cargarPlanAlimentacion(String diet) async {
    final mealPlan = await _spoonacularProvider.generateMealPlanning(diet);
    _mealPlanController.sink.add(mealPlan);
  }

  dipose() {
    _menuItemController?.close();
    _menuItemControllerSec?.close();
    _menuItemDetailController?.close();
    _ingredientesController?.close();
    _cargandoController?.close();
    _mealPlanController?.close();
  }
}
