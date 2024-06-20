import 'RestaurantDto.dart';

/// success : true
/// data : [{"_id":"65ee3340ba65d899502a454b","name":"Bazooka Fried Chicken","email":"info@bazookafriedchicken.com","address":"El-Nil Street, Dokki, Giza, Egypt","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1710109503/restaurant/t5jiykvczqeyro3nvhcl.jpg","phoneNumber":"+20 111 222 3344","password":"$2b$10$BD6NTGeYRz4DTQiDPyL4JucQrViLglYCuJa.VDzsGK0p/R0Yl8zcW","canDeliver":false,"city":"Alexandria","category":[{"_id":"65e45d142e7b6c7db92f5dbb","name":"Fried Chicken"}],"status":"active","type":"Restaurant","isDeleted":false,"createdAt":"2024-03-10T22:25:04.561Z","updatedAt":"2024-03-10T22:25:04.561Z","__v":0},{"_id":"65ee39a0b3eac564b5db7a81","name":"كرم الشام","email":"info@karmelsham.com","address":"1, El-Nasr Road, Heliopolis, Cairo, Egypt","description":"Bazooka Fried Chicken offers mouthwatering, crispy fried chicken made with fresh, high-quality ingredients. Their menu features a variety of chicken pieces, sides, and dipping sauces, catering to diverse preferences. They offer dine-in, delivery, and takeaway options, making them a convenient and flavorful choice for any meal.","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1710111135/restaurant/iwt3t6ws4iklfdevaopi.png","phoneNumber":"+20 100 000 1234","password":"$2b$10$kquWoLT8n/kn46Nh4tEGyu5bJGkjmH0NSQudL1a9fsHco7jQUiJ/S","canDeliver":false,"city":"Alexandria","category":[{"_id":"65e45e3c2a697bd614697b48","name":"Syrian"}],"status":"active","type":"Restaurant","isDeleted":false,"createdAt":"2024-03-10T22:52:16.716Z","updatedAt":"2024-03-10T22:52:16.716Z","__v":0},{"_id":"65ef7552371067489c06ec30","name":"Buffalo Burger","email":"info@buffaloburger.com","address":"Burger Restaurant","description":"Buffalo Burger is a restaurant chain specializing in burgers. They offer a variety of beef and chicken burgers, along with sides, appetizers, and desserts. They also have a selection of keto and light options for those watching their weight. ","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1710191952/restaurant/tzhay7mq8ff3m1e2rnuv.jpg","phoneNumber":"19914","password":"$2b$10$OPGyCozDlGDbs2Tbufi6c.5fIP4UtEkmcR718IW5k9crjtteCr/Wu","canDeliver":false,"city":"Alexandria","category":[{"_id":"65e460fdfa7564e23bb3d0a0","name":"Burgers"}],"status":"active","type":"Restaurant","isDeleted":false,"createdAt":"2024-03-11T21:19:14.890Z","updatedAt":"2024-03-11T21:19:14.890Z","__v":0},{"_id":"65ef7624371067489c06ec36","name":"Chick-fil-A","email":"Chick-fil-A@gmail.com","address":"Alexandria","description":"Chicken Fila, based on my findings, appears to be a restaurant chain located in Egypt, not affiliated with the American chain Chick-fil-A. ","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1710192163/restaurant/lieqwqraauj1mly20kyb.jpg","phoneNumber":"19803","password":"$2b$10$YYAzszWevDpGn0hY4e9Ygewtg1cRzF6y23qLzzD1/hiVF.NT7xq8S","canDeliver":false,"city":"Alexandria","category":[{"_id":"65e45d142e7b6c7db92f5dbb","name":"Fried Chicken"}],"status":"active","type":"Restaurant","isDeleted":false,"createdAt":"2024-03-11T21:22:44.683Z","updatedAt":"2024-03-11T21:22:44.683Z","__v":0}]
/// currentPage : 1
/// numberOfPages : 1
/// numberOfRecords : 4

class RestaurantResponse {
  RestaurantResponse({
    this.success,
    this.data,
    this.currentPage,
    this.numberOfPages,
    this.numberOfRecords,
    this.error,
    this.statusCode,
    this.message,
  });

  RestaurantResponse.fromJson(dynamic json) {
    success = json['success'];
    data = RestaurantDto.fromJson(json['data']);
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    numberOfRecords = json['numberOfRecords'];
    error = json['error'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  bool? success;
  RestaurantDto? data;
  int? currentPage;
  int? numberOfPages;
  int? numberOfRecords;
  String? error;
  String? message;
  int? statusCode;
}
