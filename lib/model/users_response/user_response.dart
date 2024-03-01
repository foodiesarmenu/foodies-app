import 'data.dart';

/// success : true
/// data : [{"_id":"65e0e4618e28dce090c547cc","name":"ehah","email":"ehab@gmail.com","countryCode":"20","phoneNumber":"01157003360","password":"$2b$12$6l6CvlcfuDDaCCTTSVS4quMYhWioUE6pztgJtVVK6eEucTbfXxorO","gender":"Male","isDeleted":false,"isEmailVerified":false,"isPhoneVerified":false,"dateOfBirth":"2024-02-29T19:58:34.230Z","type":"Client","isActive":true,"createdAt":"2024-02-29T20:09:05.074Z","updatedAt":"2024-02-29T20:09:05.074Z","__v":0},{"_id":"65e107ab6ef30e5de57271d4","name":"ehah","email":"ehabe@gmail.com","countryCode":"202","phoneNumber":"01157003360s","password":"$2b$12$ZYO38RzL25Jvq9n8ILf96esEl6A7wIgcJYNt417FD/3mVI9TFsmja","gender":"Male","isDeleted":false,"isEmailVerified":false,"isPhoneVerified":false,"dateOfBirth":"2024-02-29T19:58:34.230Z","type":"Client","isActive":true,"createdAt":"2024-02-29T22:39:39.240Z","updatedAt":"2024-02-29T22:39:39.240Z","__v":0}]
/// currentPage : 1
/// numberOfPages : 1
/// numberOfRecords : 2

class UserResponse {
  UserResponse({
    this.success,
    this.data,
    this.currentPage,
    this.numberOfPages,
    this.numberOfRecords,
  });

  UserResponse.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    numberOfRecords = json['numberOfRecords'];
  }

  bool? success;
  List<Data>? data;
  int? currentPage;
  int? numberOfPages;
  int? numberOfRecords;

  UserResponse copyWith({
    bool? success,
    List<Data>? data,
    int? currentPage,
    int? numberOfPages,
    int? numberOfRecords,
  }) =>
      UserResponse(
        success: success ?? this.success,
        data: data ?? this.data,
        currentPage: currentPage ?? this.currentPage,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        numberOfRecords: numberOfRecords ?? this.numberOfRecords,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['numberOfRecords'] = numberOfRecords;
    return map;
  }
}
