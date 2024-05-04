/// _id : "662eb9fad2409c880a0c06cb"
/// firstAddress : "13 Main St123"
/// secondAddress : "Apt 101"
/// buildingNumber : "456"
/// streetName : "Elm Street"
/// floorNumber : "2nd"
/// apartmentNumber : "101"
/// user : "661f68ada0971d280a156407"
/// note : "Near the park"
/// isPrimary : true

class DeliveryAddress {
  DeliveryAddress({
      this.id, 
      this.firstAddress, 
      this.secondAddress, 
      this.buildingNumber, 
      this.streetName, 
      this.floorNumber, 
      this.apartmentNumber, 
      this.note,
      this.isPrimary,});

  String? id;
  String? firstAddress;
  String? secondAddress;
  String? buildingNumber;
  String? streetName;
  String? floorNumber;
  String? apartmentNumber;
  String? note;
  bool? isPrimary;

}