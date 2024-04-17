import 'Meal.dart';

/// meal : {"_id":"65f0a629671f895443718c7a","restaurant":"65ee39a0b3eac564b5db7a81","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1710269992/meal/mzvhn5kqhyk2jwyw4rb9.jpg","name":"Chicken Shawerma Fattah","price":29.99,"currency":"EGP","description":"Aromatic layers of seasoned rice, crispy pita bread, and tender chicken shawarma, drizzled with a creamy tahini sauce.","rate":4.8,"tags":["chicken","shawarma","rice"],"calories":520,"protein":35,"fat":60,"carbohydrates":100,"isDeleted":false,"createdAt":"2024-03-12T18:59:53.973Z","updatedAt":"2024-03-12T18:59:53.973Z","__v":0}
/// quantity : 1
/// price : 29.99
/// _id : "661c5c788064328a2efd07bd"

class CartItem {
  CartItem({
    this.meal,
    this.quantity,
    this.price,
    this.totalPrice,
    this.id,
  });

  Meal? meal;
  num? quantity;
  num? price;
  num? totalPrice;
  String? id;
}
