class Category {
  int id;
  String image;
  String name;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  static List<Category> getAllCategories() {
    return [
      Category(
        id: 1,
        name: 'Vegetables',
        image: 'chicken_fila_logo.png',
      ),
      Category(
        id: 2,
        name: 'Meals',
        image: 'china_house_logo.png',
      ),
      Category(
        id: 3,
        name: 'Chickens',
        image: 'ice_volcano_logo.png',
      ),
      Category(
        id: 4,
        name: 'Meals',
        image: 'china_house_logo.png',
      ),
      Category(
        id: 4,
        name: 'Meals',
        image: 'china_house_logo.png',
      ),
      Category(
        id: 4,
        name: 'Meals',
        image: 'china_house_logo.png',
      ),
      Category(
        id: 4,
        name: 'Meals',
        image: 'china_house_logo.png',
      ),
      Category(
        id: 4,
        name: 'Meals',
        image: 'china_house_logo.png',
      ),
      Category(
        id: 4,
        name: 'Meals',
        image: 'china_house_logo.png',
      ),
      Category(
        id: 4,
        name: 'Meals',
        image: 'china_house_logo.png',
      ),
      Category(
        id: 4,
        name: 'Meals',
        image: 'china_house_logo.png',
      ),
      Category(
        id: 4,
        name: 'Meals',
        image: 'china_house_logo.png',
      ),
    ];
  }
}
