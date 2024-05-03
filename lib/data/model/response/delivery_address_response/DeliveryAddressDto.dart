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
    this.firstAddress,
    this.secondAddress,
    this.buildingNumber,
    this.streetName,
    this.floorNumber,
    this.apartmentNumber,
    this.note,
  });

  DeliveryAddressDto.fromJson(dynamic json) {
    firstAddress = json['firstAddress'];
    secondAddress = json['secondAddress'];
    buildingNumber = json['buildingNumber'];
    streetName = json['streetName'];
    floorNumber = json['floorNumber'];
    apartmentNumber = json['apartmentNumber'];
    note = json['note'];
  }

  String? firstAddress;
  String? secondAddress;
  String? buildingNumber;
  String? streetName;
  String? floorNumber;
  String? apartmentNumber;
  String? note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstAddress'] = firstAddress;
    map['secondAddress'] = secondAddress;
    map['buildingNumber'] = buildingNumber;
    map['streetName'] = streetName;
    map['floorNumber'] = floorNumber;
    map['apartmentNumber'] = apartmentNumber;
    map['note'] = note;
    return map;
  }

  DeliveryAddress toDeliveryAddress() {
    return DeliveryAddress(
      firstAddress: firstAddress,
      secondAddress: secondAddress,
      buildingNumber: buildingNumber,
      streetName: streetName,
      floorNumber: floorNumber,
      apartmentNumber: apartmentNumber,
      note: note,
    );
  }
}
