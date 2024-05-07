import 'package:foodies_app/data/model/response/delivery_address_response/DeliveryAddressDto.dart';
/// success : true
/// data : [{"_id":"66303939a01372ca58339111","firstAddress":"123 Main St","secondAddress":"Apt 101","buildingNumber":"456","streetName":"Elm Street","floorNumber":"2nd","apartmentNumber":"101","user":"65febe55dfd1d02c2de022ab","note":"Near the park","isPrimary":false,"isDeleted":false,"createdAt":"2024-04-30T00:20:09.436Z","updatedAt":"2024-04-30T00:20:09.436Z","__v":0}]
/// currentPage : 1
/// numberOfPages : 1
/// numberOfRecords : 1

class AddressResponseDto {
  AddressResponseDto({
      this.success, 
      this.data, 
      this.currentPage, 
      this.numberOfPages, 
      this.numberOfRecords,
      this.message,
      this.statusCode});

  AddressResponseDto.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = DeliveryAddressDto.fromJson(json['data']);
    }
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    numberOfRecords = json['numberOfRecords'];
    message = json['message'];
    statusCode = json['statusCode'];
  }
  bool? success;
  DeliveryAddressDto? data;
  num? currentPage;
  num? numberOfPages;
  num? numberOfRecords;
  String? message;
  int? statusCode;


}