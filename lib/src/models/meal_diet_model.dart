class MealDiet {
  List<dynamic> meals;
  Map<String, double> nutrients;

  MealDiet({this.meals, this.nutrients});

  MealDiet.fromJSONMap(Map<String, dynamic> jsonResponse) {
    meals = jsonResponse['meals'];
    nutrients = jsonResponse['nutrients'];
  }

  List<Meal> obtenerPlatos(List<dynamic> items) {
    if (items == null || items.length < 1) {
      return [];
    } else {
      final meals = MealItems.fromJSONList(items);
      return meals.items;
    }
  }

  Nutrients obtenerNutrientes(Map<String, double> nutrients) {
    if (nutrients == null) {
      return null;
    } else {
      final nutrientes = Nutrients.fromJsonResponse(nutrients);
      return nutrientes;
    }
  }
}

class MealItems {
  List<Meal> items = new List();
  MealItems();
  MealItems.fromJSONList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final meal = Meal.fromJSONResponse(item);
        items.add(meal);
      }
    }
  }
}

class Meal {
  int id;
  String title;
  String imageType;
  int readyInMinutes;
  int servings;
  String sourceUrl;

  Meal(
      {this.id,
      this.title,
      this.imageType,
      this.readyInMinutes,
      this.servings,
      this.sourceUrl});

  Meal.fromJSONResponse(Map<String, dynamic> jsonResponse) {
    id = jsonResponse['id'];
    title = jsonResponse['title'];
    imageType = jsonResponse['imageType'];
    readyInMinutes = jsonResponse['readyInMinutes'];
    servings = jsonResponse['servings'];
    sourceUrl = jsonResponse['sourceUrl'];
  }
}

class Nutrients {
  double calories;
  double carbohydrates;
  double fat;
  double protein;
  Nutrients({this.calories, this.carbohydrates, this.fat, this.protein});

  Nutrients.fromJsonResponse(Map<String, dynamic> jsonResponse) {
    calories = jsonResponse['calories'];
    carbohydrates = jsonResponse['carbohydrates'];
    fat = jsonResponse['fat'];
    protein = jsonResponse['protein'];
  }
}
