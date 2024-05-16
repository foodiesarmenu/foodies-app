import 'PromotionDto.dart';

/// success : true
/// data : [{"_id":"661da99bb11c27bad493619c","title":"الاكيلة","description":" 3وراك + ٣ سيخ كفتة ومعاهم رز بسمتي ب ٣٠٠🔥","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1713219996/promotion/xphifvruwmui0snupqfh.jpg","restaurant":"65ee39a0b3eac564b5db7a81","isActive":true,"isDeleted":false,"createdAt":"2024-04-15T22:26:35.970Z","updatedAt":"2024-05-08T07:20:10.717Z","__v":0},{"_id":"661dcd3829342eb2fd505b18","title":"⭐️عرض المداح مقلي😋","description":"قطعتين بروستد +٣ قطع شاورماورز بسمتي وتومية وبطاطس ب ١٣٠ ج🔥","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1713229111/promotion/ve11mbk7c8dyzj6b4han.jpg","restaurant":"65ee39a0b3eac564b5db7a81","isActive":true,"isDeleted":false,"createdAt":"2024-04-16T00:58:32.364Z","updatedAt":"2024-05-06T23:44:07.428Z","__v":0},{"_id":"661dce618bf6ea0f99fa1905","title":"⭐️عرض المال الحلال 😋","description":" قطع كريسبي + قطعتين ماريا ورز بسمتي وتومية وبطاطس ب ١٣٠ ج🔥","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1713229408/promotion/cgn07lytvmv37nw4gwdp.jpg","restaurant":"65ee39a0b3eac564b5db7a81","isActive":true,"isDeleted":false,"createdAt":"2024-04-16T01:03:29.066Z","updatedAt":"2024-04-16T01:53:41.235Z","__v":0},{"_id":"662b953fa6d6ac956e18c6d5","title":"BUFF ONE","description":"عرض جديد BUFF ONE من بافالو برجر 🍔\nساندوتش 150 جرام وبطاطس بـ 99 جنيه شامل الضريبة 🙌","image":"http://res.cloudinary.com/dlvndc08a/image/upload/v1714132287/promotion/thkiz0ykftchtcxjjqmj.jpg","restaurant":"65ee3340ba65d899502a454b","isActive":true,"isDeleted":false,"createdAt":"2024-04-26T11:51:27.800Z","updatedAt":"2024-04-26T11:51:27.800Z","__v":0}]
/// currentPage : 1
/// numberOfPages : 1
/// numberOfRecords : 4

class PromotionResponseDto {
  PromotionResponseDto({this.success, this.data});

  PromotionResponseDto.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(PromotionDto.fromJson(v));
      });
    }
  }

  bool? success;
  List<PromotionDto>? data;
}
