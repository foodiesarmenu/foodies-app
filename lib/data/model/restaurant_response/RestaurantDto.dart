import '../../../domain/model/Restaurant.dart';
import '../category_response/CategoryDto.dart';

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
/// type : "Restaurant"
/// isDeleted : false
/// createdAt : "2024-03-10T22:25:04.561Z"
/// updatedAt : "2024-03-10T22:25:04.561Z"
/// __v : 0

class RestaurantDto {
  RestaurantDto({
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
    this.type,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  RestaurantDto.fromJson(dynamic json) {
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
        category?.add(CategoryDto.fromJson(v));
      });
    }
    status = json['status'];
    type = json['type'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
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
  List<CategoryDto>? category;
  String? status;
  String? type;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? v;

  RestaurantDto copyWith({
    String? id,
    String? name,
    String? email,
    String? address,
    String? image,
    String? phoneNumber,
    String? password,
    bool? canDeliver,
    String? city,
    List<CategoryDto>? category,
    String? status,
    String? type,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      RestaurantDto(
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
        type: type ?? this.type,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
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
    map['type'] = type;
    map['isDeleted'] = isDeleted;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  Restaurant toRestaurant() {
    return Restaurant(
      id: id,
      name: name,
      email: email,
      address: address,
      image: image,
      phoneNumber: phoneNumber,
      password: password,
      canDeliver: canDeliver,
      city: city,
      category:
          category!.map((categoryDto) => categoryDto.toCategory()).toList(),
      status: status,
    );
  }
}
