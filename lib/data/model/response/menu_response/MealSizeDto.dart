import '../../../../domain/model/MealSize.dart';

/// size : "Small"
/// price : 10
/// _id : "6633d294b98333c2be94fdfe"

class MealSizeDto {
  MealSizeDto({
      this.size, 
      this.price, 
      this.id,});

  String? size;
  num? price;
  String? id;

  MealSizeDto.fromJson(dynamic json) {
    size = json['size'];
    price = json['price'];
    id = json['_id'];
  }

  MealSize toMealSize() {
    return MealSize(
      size: size,
      price: price,
      id: id,
    );
  }
}