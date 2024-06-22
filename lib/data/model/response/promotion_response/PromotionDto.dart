import '../../../../domain/model/Promotion.dart';
import '../restaurant_response/RestaurantDto.dart';

/// _id : "661da99bb11c27bad493619c"
/// title : "الاكيلة"
/// description : " 3وراك + ٣ سيخ كفتة ومعاهم رز بسمتي ب ٣٠٠🔥"
/// image : "http://res.cloudinary.com/dlvndc08a/image/upload/v1713219996/promotion/xphifvruwmui0snupqfh.jpg"
/// restaurant : "65ee39a0b3eac564b5db7a81"
/// isActive : true
/// isDeleted : false
/// createdAt : "2024-04-15T22:26:35.970Z"
/// updatedAt : "2024-05-08T07:20:10.717Z"
/// __v : 0

class PromotionDto {
  PromotionDto({
    this.id,
    this.title,
    this.description,
    this.image,
    this.restaurant,
  });

  PromotionDto.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    restaurant = json['restaurant'] != null
        ? RestaurantDto.fromJson(json['restaurant'])
        : null;
  }

  String? id;
  String? title;
  String? description;
  String? image;
  RestaurantDto? restaurant;

  Promotion toPromotion() {
    return Promotion(
      id: id,
      title: title,
      description: description,
      image: image,
      restaurant: restaurant?.toRestaurant(),
    );
  }
}
