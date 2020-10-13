class MenuItemsDetail {
  List<MenuItemDetail> items = new List();

  MenuItemsDetail();
  MenuItemsDetail.fromJSONList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final detail = new MenuItemDetail.fromJSONMap(item);
        items.add(detail);
      }
    }
  }
}

class MenuItemDetail {
  int id;
  String title;
  String restaurantChain;
  Map<String, dynamic> nutrition;
  List<dynamic> badges;
  List<String> breadcrumbs;
  String generatedText;
  String imageType;
  double likes;
  int numberOfServings;
  double price;
  dynamic readableServingSize;
  dynamic servingSize;
  dynamic spoonacularScore;

  MenuItemDetail({
    this.id,
    this.title,
    this.restaurantChain,
    this.nutrition,
    this.badges,
    this.breadcrumbs,
    this.generatedText,
    this.imageType,
    this.likes,
    this.numberOfServings,
    this.price,
    this.readableServingSize,
    this.servingSize,
    this.spoonacularScore,
  });

  MenuItemDetail.fromJSONMap(Map<String, dynamic> jsonResponse) {
    id = jsonResponse['id'];
    title = jsonResponse['title'];
    restaurantChain = jsonResponse['restaurantChain'];
    nutrition = jsonResponse['nutrition'];
    badges = jsonResponse['badges'];
    breadcrumbs = jsonResponse['breadcrumbs'];
    generatedText = jsonResponse['generatedText'];
    imageType = jsonResponse['imageType'];
    likes = jsonResponse['likes'];
    numberOfServings = jsonResponse['numberOfServings'];
    price = jsonResponse['price'];
    readableServingSize = jsonResponse['readableServingSize'];
    servingSize = jsonResponse['servingSize'];
    spoonacularScore = jsonResponse['spoonacularScore'];
  }
  List<Nutrients> obtenerNutrientes(List<dynamic> nutrition) {
    if (nutrition == null) {
      return [];
    } else {
      final nutrientes = NutrientsItems.fromJSONList(nutrition);
      return nutrientes.nutrientes;
    }
  }

  CaloricBreakdown obtenerCaloricBreakdown(
      Map<String, dynamic> caloricBreackdownMap) {
    if (caloricBreackdownMap == null) {
      return null;
    } else {
      CaloricBreakdown caloricBreakdown =
          CaloricBreakdown.fromJSONMAP(caloricBreackdownMap);
      return caloricBreakdown;
    }
  }
}

class NutrientsItems {
  List<Nutrients> nutrientes = new List();
  NutrientsItems();
  NutrientsItems.fromJSONList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final nutriente = new Nutrients.fromJSONMap(item);
        nutrientes.add(nutriente);
      }
    }
  }
}

class Nutrients {
  String title;
  int amount;
  String unit;
  int percentOfDailyNeeds;

  Nutrients({this.title, this.amount, this.unit, this.percentOfDailyNeeds});

  Nutrients.fromJSONMap(Map<String, dynamic> jsonResponse) {
    title = jsonResponse['title'];
    amount = jsonResponse['amount'];
    unit = jsonResponse['unit'];
    percentOfDailyNeeds = jsonResponse['percentOfDailyNeeds'];
  }
}

class CaloricBreakdown {
  int percentProtein;
  int percentFat;
  int percentCarbs;
  CaloricBreakdown({this.percentProtein, this.percentFat, this.percentCarbs});
  CaloricBreakdown.fromJSONMAP(Map<String, dynamic> jsonResponse) {
    percentProtein = jsonResponse['percentProtein'];
    percentFat = jsonResponse['percentFat'];
    percentCarbs = jsonResponse['percentCarbs'];
  }
}
