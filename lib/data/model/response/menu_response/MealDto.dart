import '../../../../domain/model/Meal.dart';
import 'MealSizeDto.dart';

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
    this.sizes,
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
    if (json['sizes'] != null) {
      sizes = [];
      json['sizes'].forEach((v) {
        sizes?.add(MealSizeDto.fromJson(v));
      });
    }
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
  List<MealSizeDto>? sizes;

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
      sizes: sizes?.map((e) => e.toMealSize()).toList(),
    );
  }
}
