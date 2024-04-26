/// user : "65febe55dfd1d02c2de022ab"
/// restaurant : "65ee39a0b3eac564b5db7a81"
/// isDeleted : false
/// _id : "662af14cdf5899f01085767c"
/// createdAt : "2024-04-26T00:11:56.634Z"
/// updatedAt : "2024-04-26T00:11:56.634Z"
/// __v : 0

class Favourite {
  Favourite({
    this.user,
    this.restaurant,
    this.id,
  });

  Favourite.fromJson(dynamic json) {
    user = json['user'];
    restaurant = json['restaurant'];
    id = json['_id'];
  }

  String? user;
  String? restaurant;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = user;
    map['restaurant'] = restaurant;
    map['_id'] = id;
    return map;
  }
}
