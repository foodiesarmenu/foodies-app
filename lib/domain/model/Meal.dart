import 'MealSize.dart';

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

class Meal {
  Meal({
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
    this.sizes,
  });

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
  List<MealSize>? sizes;

}
