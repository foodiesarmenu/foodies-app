import '../../../../domain/model/Menu.dart';
import 'MealDto.dart';

/// name : "traditional"
/// description : "Meals tagged with traditional"
/// meals : [{"_id":"65f07c75199e09c646a5bf84","restaurant":"65ee39a0b3eac564b5db7a81","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1710259315/meal/drn2kjljn4inotrfp4yi.jpg","name":"طبق مشكللة لحم الضأن (Dish of Mixed Grilled Lamb)","price":75.5,"currency":"EGP","description":"طبق مشكللة لحم الضأن الشهية والمميزة من مطعم كرم الشام. يقدم مع الأرز والمكسرات والصنوبر. (A delicious and special dish of mixed grilled lamb from Kerm El Sham. Served with rice, nuts, and pine nuts.)","rate":4.8,"tags":["traditional"],"calories":520,"protein":35,"fat":20,"carbohydrates":40,"isDeleted":false,"createdAt":"2024-03-12T16:01:57.393Z","updatedAt":"2024-03-12T16:01:57.393Z","__v":0}]

class MenuDto {
  MenuDto({
    this.name,
    this.description,
    this.meals,
  });

  MenuDto.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    if (json['meals'] != null) {
      meals = [];
      json['meals'].forEach((v) {
        meals?.add(MealDto.fromJson(v));
      });
    }
  }

  String? name;
  String? description;
  List<MealDto>? meals;


  Menu toMenu() {
    return Menu(
      name: name,
      description: description,
      meals: meals?.map((e) => e.toMeal()).toList(),
    );
  }
}
