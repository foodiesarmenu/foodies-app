import 'package:foodies_app/domain/model/Favourite.dart';

/// user : "65febe55dfd1d02c2de022ab"
/// restaurant : "65ee39a0b3eac564b5db7a81"
/// isDeleted : false
/// _id : "662af14cdf5899f01085767c"
/// createdAt : "2024-04-26T00:11:56.634Z"
/// updatedAt : "2024-04-26T00:11:56.634Z"
/// __v : 0

class FavouriteDto {
  FavouriteDto({
    this.user,
    this.restaurant,
    this.isDeleted,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  FavouriteDto.fromJson(dynamic json) {
    user = json['user'];
    restaurant = json['restaurant'];
    isDeleted = json['isDeleted'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? user;
  String? restaurant;
  bool? isDeleted;
  String? id;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = user;
    map['restaurant'] = restaurant;
    map['isDeleted'] = isDeleted;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  Favourite toFavorite() {
    return Favourite(
      user: user,
      restaurant: restaurant,
      id: id,
    );
  }
}
