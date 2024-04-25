import '../../../../domain/model/OnlineOrder.dart';

class OnlineOrderDto {
  OnlineOrderDto({
    this.id,
    this.cancelUrl,
    this.successUrl,
    this.url,
  });

  OnlineOrderDto.fromJson(dynamic json) {
    id = json['id'];

    cancelUrl = json['cancel_url'];

    successUrl = json['success_url'];
    url = json['url'];
  }

  String? id;
  String? cancelUrl;
  String? successUrl;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['cancel_url'] = cancelUrl;
    map['success_url'] = successUrl;
    map['url'] = url;
    return map;
  }

  OnlineOrder toOnlineOrder() {
    return OnlineOrder(
      id: id,
      cancelUrl: cancelUrl,
      successUrl: successUrl,
      url: url,
    );
  }
}
