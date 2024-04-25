import 'CartItem.dart';
import 'DeliveryAddress.dart';
import 'Restaurant.dart';

/// _id : "66234aa16a22215e3e14fdd7"
/// userId : "65febe55dfd1d02c2de022ab"
/// orderItems : [{"meal":{"_id":"65f0a629671f895443718c7a","restaurant":"65ee39a0b3eac564b5db7a81","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1710269992/meal/mzvhn5kqhyk2jwyw4rb9.jpg","name":"Chicken Shawerma Fattah","price":29.99,"currency":"EGP","description":"Aromatic layers of seasoned rice, crispy pita bread, and tender chicken shawarma, drizzled with a creamy tahini sauce.","rate":4.8,"tags":["chicken","shawarma","rice"],"calories":520,"protein":35,"fat":60,"carbohydrates":100,"isDeleted":false,"createdAt":"2024-03-12T18:59:53.973Z","updatedAt":"2024-03-12T18:59:53.973Z","__v":0},"quantity":1,"price":29.99,"totalPrice":29.99,"_id":"66230f7fb02fc754832367ef"}]
/// orderTotalPrice : 29.99
/// totalPriceAfterDiscount : 29.99
/// discount : 0
/// restaurant : {"_id":"65ee39a0b3eac564b5db7a81","name":"كرم الشام","email":"info@karmelsham.com","address":"1, El-Nasr Road, Heliopolis, Cairo, Egypt","description":"Bazooka Fried Chicken offers mouthwatering, crispy fried chicken made with fresh, high-quality ingredients. Their menu features a variety of chicken pieces, sides, and dipping sauces, catering to diverse preferences. They offer dine-in, delivery, and takeaway options, making them a convenient and flavorful choice for any meal.","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1710111135/restaurant/iwt3t6ws4iklfdevaopi.png","phoneNumber":"+20 100 000 1234","canDeliver":false,"city":"Alexandria","status":"active","type":"Restaurant","isDeleted":false,"createdAt":"2024-03-10T22:52:16.716Z","updatedAt":"2024-03-10T22:52:16.716Z","__v":0}
/// noOfOrderItems : 1
/// status : "pending"
/// paymentMethod : "cash"
/// isPaid : false
/// deliveryAddress : {"firstAddress":"123 Main St222222","secondAddress":"Apt 1012222","buildingNumber":"Building A22","streetName":"Oak Avenue22","floorNumber":"2nd Floor222","apartmentNumber":"10122","note":"Near the park2"}
/// isDeleted : false
/// createdAt : "2024-04-20T04:54:57.062Z"
/// updatedAt : "2024-04-20T04:54:57.062Z"
/// __v : 0

class CashOrder {
  CashOrder({
    this.id,
    this.userId,
    this.orderItems,
    this.orderTotalPrice,
    this.totalPriceAfterDiscount,
    this.discount,
    this.restaurant,
    this.noOfOrderItems,
    this.status,
    this.paymentMethod,
    this.isPaid,
    this.deliveryAddress,
  });

  String? id;
  String? userId;
  List<CartItem>? orderItems;
  num? orderTotalPrice;
  num? totalPriceAfterDiscount;
  num? discount;
  Restaurant? restaurant;
  num? noOfOrderItems;
  String? status;
  String? paymentMethod;
  bool? isPaid;
  DeliveryAddress? deliveryAddress;
}
