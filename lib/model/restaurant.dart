class Restaurant {
  int id;
  String image;
  String name;
  String rates;
  String destination;
  String service;
  String deliveryTime;
  String deliveryCost;
  String sale;

  Restaurant(
      {required this.id,
      required this.name,
      required this.image,
      required this.service,
      required this.rates,
      required this.destination,
      required this.deliveryTime,
      required this.deliveryCost,
      required this.sale});

  static List<Restaurant> getAllRestaurants() {
    return [
      Restaurant(
        id: 1,
        name: 'Chicken Fila',
        image: 'chicken_fila_logo.png',
        service: 'Fried chicken, Sandwiches, Burgers',
        rates: '4.2(99+)',
        deliveryTime: '20 mins',
        deliveryCost: 'EGP 15.99',
        destination: '3 Km away',
        sale: 'EGP 40.00 off selected items',
      ),
      Restaurant(
        id: 2,
        name: 'China House',
        image: 'china_house_logo.png',
        service: 'Chinese, Asian, Thai, Indian , Sushi',
        rates: '4.5(99+)',
        deliveryTime: '20 mins',
        deliveryCost: 'EGP 15.99',
        destination: '2 Km away',
        sale: 'EGP 40.00 off selected items',
      ),
      Restaurant(
        id: 3,
        name: 'Ice Volcano',
        image: 'ice_volcano_logo.png',
        service: 'Desserts, Beverages, Chocolate',
        rates: '4.3(99+)',
        deliveryTime: '20 mins',
        deliveryCost: 'EGP 15.99',
        destination: '5 Km away',
        sale: 'EGP 40.00 off selected items',
      ),
    ];
  }
}
