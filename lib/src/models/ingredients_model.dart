class Ingredients {
  List<Ingredient> items = new List();
  Ingredients();
  Ingredients.fromJSONList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final ingrediente = Ingredient.fomJsonMap(item);
        items.add(ingrediente);
      }
    }
  }
}

class Ingredient {
  Map<String, dynamic> amount;
  String image;
  String name;
  Ingredient.fomJsonMap(Map<String, dynamic> jsonResponse) {
    amount = jsonResponse['amount'];
    image = jsonResponse['image'];
    name = jsonResponse['name'];
  }
  Metric obtenerMetric(Map<String, dynamic> amount) {
    if (amount == null) {
      return null;
    } else {
      final Metric metric = Metric.fromJSONMap(amount);
      return metric;
    }
  }

  Us obtenerUs(Map<String, dynamic> amount) {
    if (amount == null) {
      return null;
    } else {
      final Us us = Us.fromJSONMap(amount);
      return us;
    }
  }
}

class Metric {
  String unit;
  double value;
  Metric(this.unit, this.value);
  Metric.fromJSONMap(Map<String, dynamic> jsonResponse) {
    unit = jsonResponse['unit'];
    value = jsonResponse['value'];
  }
}

class Us {
  String unit;
  double value;
  Us(this.unit, this.value);
  Us.fromJSONMap(Map<String, dynamic> jsonResponse) {
    unit = jsonResponse['unit'];
    value = jsonResponse['value'];
  }
}
