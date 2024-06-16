import 'package:foodies_app/domain/model/Restaurant.dart';

/// _id : "661da99bb11c27bad493619c"
/// title : "الاكيلة"
/// description : " 3وراك + ٣ سيخ كفتة ومعاهم رز بسمتي ب ٣٠٠🔥"
/// image : "http://res.cloudinary.com/dlvndc08a/image/upload/v1713219996/promotion/xphifvruwmui0snupqfh.jpg"
/// restaurant : "65ee39a0b3eac564b5db7a81"

class Promotion {
  Promotion({
    this.id,
    this.title,
    this.description,
    this.image,
    this.restaurant,
  });

  String? id;
  String? title;
  String? description;
  String? image;
  Restaurant? restaurant;
}
