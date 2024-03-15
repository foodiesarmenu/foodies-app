import '../../../domain/model/Meal.dart';

/// _id : "65f07c75199e09c646a5bf84"
/// restaurant : "65ee39a0b3eac564b5db7a81"
/// image : "http://res.cloudinary.com/dlvndc08a/image/upload/v1710259315/meal/drn2kjljn4inotrfp4yi.jpg"
/// name : "طبق مشكللة لحم الضأن (Dish of Mixed Grilled Lamb)"
/// price : 75.5
/// currency : "EGP"
/// description : "طبق مشكللة لحم الضأن الشهية والمميزة من مطعم كرم الشام. يقدم مع الأرز والمكسرات والصنوبر. (A delicious and special dish of mixed grilled lamb from Kerm El Sham. Served with rice, nuts, and pine nuts.)"
/// rate : 4.8
/// tags : ["traditional"]
/// calories : 520
/// protein : 35
/// fat : 20
/// carbohydrates : 40
/// isDeleted : false
/// createdAt : "2024-03-12T16:01:57.393Z"
/// updatedAt : "2024-03-12T16:01:57.393Z"
/// __v : 0

class MealDto {
  MealDto({
    this.id,
    this.restaurant,
    this.image,
    this.name,
    this.price,
    this.currency,
    this.description,
    this.rate,
    this.tags,
    this.calories,
    this.protein,
    this.fat,
    this.carbohydrates,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  MealDto.fromJson(dynamic json) {
    id = json['_id'];
    restaurant = json['restaurant'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
    currency = json['currency'];
    description = json['description'];
    rate = json['rate'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    calories = json['calories'];
    protein = json['protein'];
    fat = json['fat'];
    carbohydrates = json['carbohydrates'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? restaurant;
  String? image;
  String? name;
  num? price;
  String? currency;
  String? description;
  num? rate;
  List<String>? tags;
  num? calories;
  num? protein;
  num? fat;
  num? carbohydrates;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  num? v;

  MealDto copyWith({
    String? id,
    String? restaurant,
    String? image,
    String? name,
    num? price,
    String? currency,
    String? description,
    num? rate,
    List<String>? tags,
    num? calories,
    num? protein,
    num? fat,
    num? carbohydrates,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      MealDto(
        id: id ?? this.id,
        restaurant: restaurant ?? this.restaurant,
        image: image ?? this.image,
        name: name ?? this.name,
        price: price ?? this.price,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        rate: rate ?? this.rate,
        tags: tags ?? this.tags,
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        carbohydrates: carbohydrates ?? this.carbohydrates,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['restaurant'] = restaurant;
    map['image'] = image;
    map['name'] = name;
    map['price'] = price;
    map['currency'] = currency;
    map['description'] = description;
    map['rate'] = rate;
    map['tags'] = tags;
    map['calories'] = calories;
    map['protein'] = protein;
    map['fat'] = fat;
    map['carbohydrates'] = carbohydrates;
    map['isDeleted'] = isDeleted;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  Meal toMeal() {
    return Meal(
      id: id,
      restaurant: restaurant,
      image: image,
      name: name,
      price: price,
      currency: currency,
      description: description,
      rate: rate,
      tags: tags,
      calories: calories,
      protein: protein,
      fat: fat,
      carbohydrates: carbohydrates,
    );
  }
}
