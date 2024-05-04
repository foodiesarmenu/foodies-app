import '../../../../domain/model/DeliveryAddress.dart';

/// firstAddress : "123 Main St222222"
/// secondAddress : "Apt 1012222"
/// buildingNumber : "Building A22"
/// streetName : "Oak Avenue22"
/// floorNumber : "2nd Floor222"
/// apartmentNumber : "10122"
/// note : "Near the park2"

class DeliveryAddressDto {
  DeliveryAddressDto({
    this.id,
    this.firstAddress,
    this.secondAddress,
    this.buildingNumber,
    this.streetName,
    this.floorNumber,
    this.apartmentNumber,
    this.user,
    this.note,
    this.isPrimary,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,});

  DeliveryAddressDto.fromJson(dynamic json) {
    id = json['_id'];
    firstAddress = json['firstAddress'];
    secondAddress = json['secondAddress'];
    buildingNumber = json['buildingNumber'];
    streetName = json['streetName'];
    floorNumber = json['floorNumber'];
    apartmentNumber = json['apartmentNumber'];
    user = json['user'];
    note = json['note'];
    isPrimary = json['isPrimary'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? firstAddress;
  String? secondAddress;
  String? buildingNumber;
  String? streetName;
  String? floorNumber;
  String? apartmentNumber;
  String? user;
  String? note;
  bool? isPrimary;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  num? v;


  DeliveryAddress toDeliveryAddress() {
    return DeliveryAddress(
      firstAddress: firstAddress,
      secondAddress: secondAddress,
      buildingNumber: buildingNumber,
      streetName: streetName,
      floorNumber: floorNumber,
      apartmentNumber: apartmentNumber,
      note: note,
      isPrimary: isPrimary,
      id: id,
    );
  }
}
