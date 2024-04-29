import 'Restaurant.dart';

/// _id : "662bf38a1726f1cbb2222d96"
/// user : "65febe55dfd1d02c2de022ab"
/// restaurant : {"_id":"65ef7552371067489c06ec30","name":"Buffalo Burger","email":"info@buffaloburger.com","address":"Burger Restaurant","description":"Buffalo Burger is a restaurant chain specializing in burgers. They offer a variety of beef and chicken burgers, along with sides, appetizers, and desserts. They also have a selection of keto and light options for those watching their weight. ","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1710191952/restaurant/tzhay7mq8ff3m1e2rnuv.jpg","phoneNumber":"19914","canDeliver":false,"city":"Alexandria","status":"active","type":"Restaurant"}

class Favourite {
  Favourite({
    this.id,
    this.user,
    this.restaurant,
  });

  String? id;
  String? user;
  Restaurant? restaurant;
}
