import 'Category.dart';

/// _id : "65ee3340ba65d899502a454b"
/// name : "Bazooka Fried Chicken"
/// email : "info@bazookafriedchicken.com"
/// address : "El-Nil Street, Dokki, Giza, Egypt"
/// image : "http://res.cloudinary.com/dlvndc08a/image/upload/v1710109503/restaurant/t5jiykvczqeyro3nvhcl.jpg"
/// phoneNumber : "+20 111 222 3344"
/// password : "$2b$10$BD6NTGeYRz4DTQiDPyL4JucQrViLglYCuJa.VDzsGK0p/R0Yl8zcW"
/// canDeliver : false
/// city : "Alexandria"
/// category : [{"_id":"65e45d142e7b6c7db92f5dbb","name":"Fried Chicken"}]
/// status : "active"

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.email,
    this.address,
    this.image,
    this.phoneNumber,
    this.password,
    this.canDeliver,
    this.city,
    this.category,
    this.status,
  });

  Restaurant.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    canDeliver = json['canDeliver'];
    city = json['city'];
    if (json['category'] != null) {
      category = [];
      json['category'].forEach((v) {
        category?.add(Category.fromJson(v));
      });
    }
    status = json['status'];
  }

  String? id;
  String? name;
  String? email;
  String? address;
  String? image;
  String? phoneNumber;
  String? password;
  bool? canDeliver;
  String? city;
  List<Category>? category;
  String? status;

  Restaurant copyWith({
    String? id,
    String? name,
    String? email,
    String? address,
    String? image,
    String? phoneNumber,
    String? password,
    bool? canDeliver,
    String? city,
    List<Category>? category,
    String? status,
  }) =>
      Restaurant(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        address: address ?? this.address,
        image: image ?? this.image,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        canDeliver: canDeliver ?? this.canDeliver,
        city: city ?? this.city,
        category: category ?? this.category,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['address'] = address;
    map['image'] = image;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['canDeliver'] = canDeliver;
    map['city'] = city;
    if (category != null) {
      map['category'] = category?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }
}
