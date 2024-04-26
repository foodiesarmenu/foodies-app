import 'FavouriteDto.dart';

/// success : true
/// data : {"user":"65febe55dfd1d02c2de022ab","restaurant":"65ee39a0b3eac564b5db7a81","isDeleted":false,"_id":"662af14cdf5899f01085767c","createdAt":"2024-04-26T00:11:56.634Z","updatedAt":"2024-04-26T00:11:56.634Z","__v":0}

class FavouriteResponseDto {
  FavouriteResponseDto({
    this.success,
    this.data,
    this.statusCode,
    this.message,
    this.error,
  });

  FavouriteResponseDto.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? FavouriteDto.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    message =
        json['message'] != null ? List<String>.from(json['message']) : null;
    error = json['error'];
  }

  bool? success;
  FavouriteDto? data;
  int? statusCode;
  List<String>? message;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['error'] = error;
    return map;
  }
}
