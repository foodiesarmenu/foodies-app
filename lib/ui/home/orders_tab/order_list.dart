class Order {
  final String id;
  final String restaurantName;
  final String price;
  final String orderStatus;
  final String orderDate;
  final String imageUrl;

  Order({
    required this.id,
    required this.restaurantName,
    required this.price,
    required this.orderStatus,
    required this.orderDate,
    required this.imageUrl,
  });
}