class MenuItemDetail {
  int id;
  String title;
  String restaurantChain;
  Map<String, dynamic> nutrition;
  List<dynamic> badges;
  List<dynamic> breadcrumbs;
  String generatedText;
  String imageType;
  double likes;
  double numberOfServings;
  double price;
  dynamic readableServingSize;
  dynamic servingSize;
  dynamic spoonacularScore;
  List<dynamic> images;

  MenuItemDetail(
      {this.id,
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
      this.images});

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
    images = jsonResponse['images'];
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
  double amount;
  String unit;
  double percentOfDailyNeeds;
  Nutrients({this.title, this.amount, this.unit, this.percentOfDailyNeeds});

  Nutrients.fromJSONMap(Map<String, dynamic> jsonResponse) {
    title = jsonResponse['title'];
    amount = jsonResponse['amount'];
    unit = jsonResponse['unit'];
    percentOfDailyNeeds = jsonResponse['percentOfDailyNeeds'];
  }
}

class CaloricBreakdown {
  double percentProtein;
  double percentFat;
  double percentCarbs;
  CaloricBreakdown({this.percentProtein, this.percentFat, this.percentCarbs});
  CaloricBreakdown.fromJSONMAP(Map<String, dynamic> jsonResponse) {
    percentProtein = jsonResponse['percentProtein'];
    percentFat = jsonResponse['percentFat'];
    percentCarbs = jsonResponse['percentCarbs'];
  }
}
