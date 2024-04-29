import 'package:foodies_app/domain/model/Favourite.dart';

import '../restaurant_response/RestaurantDto.dart';

/// _id : "662bf38a1726f1cbb2222d96"
/// user : "65febe55dfd1d02c2de022ab"
/// restaurant : {"_id":"65ef7552371067489c06ec30","name":"Buffalo Burger","email":"info@buffaloburger.com","address":"Burger Restaurant","description":"Buffalo Burger is a restaurant chain specializing in burgers. They offer a variety of beef and chicken burgers, along with sides, appetizers, and desserts. They also have a selection of keto and light options for those watching their weight. ","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1710191952/restaurant/tzhay7mq8ff3m1e2rnuv.jpg","phoneNumber":"19914","canDeliver":false,"city":"Alexandria","category":[{"_id":"65e460fdfa7564e23bb3d0a0","name":"Burgers"}],"status":"active","type":"Restaurant"}

class FavouriteDto {
  FavouriteDto({
    this.id,
    this.user,
    this.restaurant,
    this.acknowledged,
    this.deletedCount,
    this.error,
  });

  FavouriteDto.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'];
    restaurant = json['restaurant'] != null
        ? RestaurantDto.fromJson(json['restaurant'])
        : null;
    acknowledged = json['acknowledged'];
    deletedCount = json['deletedCount'];
    error = json['error'];
  }

  String? id;
  String? user;
  RestaurantDto? restaurant;
  bool? acknowledged;
  int? deletedCount;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['user'] = user;
    if (restaurant != null) {
      map['restaurant'] = restaurant?.toJson();
    }
    map['acknowledged'] = acknowledged;
    map['deletedCount'] = deletedCount;
    map['error'] = error;
    return map;
  }

  Favourite toFavourite() {
    return Favourite(
      id: id,
      user: user,
      restaurant: restaurant?.toRestaurant(),
    );
  }
}