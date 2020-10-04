class MenuItems {
  List<MenuItem> items = new List();
  MenuItems();
  MenuItems.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final menuItem = new MenuItem.fromJSONMap(item);
        items.add(menuItem);
      }
    }
  }
}

class MenuItem {
  int id;
  String title;
  String image;
  String imageType;
  dynamic readableServingSize;
  dynamic servingSize;
  MenuItem(
      {this.id,
      this.title,
      this.image,
      this.imageType,
      this.readableServingSize,
      this.servingSize});

  MenuItem.fromJSONMap(Map<String, dynamic> jsonResponse) {
    id = jsonResponse['id'];
    title = jsonResponse['title'];
    image = jsonResponse['image'];
    imageType = jsonResponse['imageType'];
    readableServingSize = jsonResponse['readableServingSize'];
    servingSize = jsonResponse['servingSize'];
  }
  getMenuItemImage() {
    if (image == null) {
      return 'https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png';
    } else {
      return image;
    }
  }
}
