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


}
