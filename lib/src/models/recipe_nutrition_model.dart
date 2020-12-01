class RecipeNutrition {
  String calories;
  String carbs;
  String fat;
  String protein;
  List<dynamic> bad;
  List<dynamic> good;
  RecipeNutrition(
      this.calories, this.carbs, this.fat, this.protein, this.bad, this.good);

  RecipeNutrition.fromJSONMap(Map<String, dynamic> json) {
    calories = json['calories'];
    carbs = json['carbs'];
    fat = json['fat'];
    protein = json['protein'];
    bad = json['bad'];
    good = json['good'];
  }
  List<Good> obtenerGood(List<dynamic> items) {
    if (items == null || items.length < 1) {
      return [];
    } else {
      final goodList = GoodList.fromJSONList(items);
      return goodList.items;
    }
  }

  List<Bad> obtenerBad(List<dynamic> items) {
    if (items == null || items.length < 1) {
      return [];
    } else {
      final badList = BadList.fromJSONList(items);
      return badList.items;
    }
  }
}

class BadList {
  List<Bad> items = new List();
  BadList();
  BadList.fromJSONList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final bad = Bad.fronJSONResponse(item);
        items.add(bad);
      }
    }
  }
}

class Bad {
  String amount;
  bool indented;
  double percentOfDailyNeeds;
  String title;
  Bad(this.amount, this.indented, this.percentOfDailyNeeds, this.title);
  Bad.fronJSONResponse(Map<String, dynamic> json) {
    amount = json['amount'];
    indented = json['indented'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
    title = json['title'];
  }
}

class GoodList {
  List<Good> items = new List();
  GoodList();
  GoodList.fromJSONList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final good = Good.fronJSONResponse(item);
        items.add(good);
      }
    }
  }
}

class Good {
  String amount;
  bool indented;
  double percentOfDailyNeeds;
  String title;
  Good(this.amount, this.indented, this.percentOfDailyNeeds, this.title);
  Good.fronJSONResponse(Map<String, dynamic> json) {
    amount = json['amount'];
    indented = json['indented'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'] / 1.0;
    title = json['title'];
  }
}
