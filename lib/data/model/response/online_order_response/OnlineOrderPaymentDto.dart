import 'OnlineOrderDto.dart';

/// success : true
/// data : {"id":"cs_test_a1Ml8vxaZewg7AoiqUyec0BxTbCzl4ZUpOIvQMH9BAhXjBVjW6M9XvvXeS","object":"checkout.session","after_expiration":null,"allow_promotion_codes":null,"amount_subtotal":2999,"amount_total":2999,"billing_address_collection":null,"cancel_url":"https://www.yahoo.com/","client_reference_id":"66230f7fb02fc754832367ee","client_secret":null,"consent":null,"consent_collection":null,"created":1713573762,"currency":"usd","currency_conversion":null,"custom_fields":[],"customer":null,"customer_creation":"if_required","customer_email":"yehya404@gmail.com","expires_at":1713660162,"invoice":null,"livemode":false,"locale":null,"mode":"payment","payment_intent":null,"payment_link":null,"payment_method_collection":"if_required","payment_method_configuration_details":null,"payment_status":"unpaid","recovered_from":null,"saved_payment_method_options":null,"setup_intent":null,"shipping_address_collection":null,"shipping_cost":null,"shipping_details":null,"shipping_options":[],"status":"open","submit_type":null,"subscription":null,"success_url":"https://www.google.com/","ui_mode":"hosted","url":"https://checkout.stripe.com/c/pay/cs_test_a1Ml8vxaZewg7AoiqUyec0BxTbCzl4ZUpOIvQMH9BAhXjBVjW6M9XvvXeS#fidkdWxOYHwnPyd1blpxYHZxWjA0VTIxXzVXc19EUlR3Njx8TVxtRm9mcDNHPDBIYzc1MGxyU3dtR25rbUt3PVNANE1VVnQzb3RUbD1zMVRtaTxVQXQ0ZEx3cVNMSkxEZDI8UX88bmRRUD19NTVDRnwwVWI0TCcpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl"}

class OnlineOrderPaymentDto {
  OnlineOrderPaymentDto(
      {this.success, this.data, this.error, this.message, this.statusCode});

  OnlineOrderPaymentDto.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? OnlineOrderDto.fromJson(json['data']) : null;
    error = json['error'];
    message = json['message'];
    statusCode = json['statusCode'];
  }

  bool? success;
  OnlineOrderDto? data;
  String? error;
  String? message;
  int? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['error'] = error;
    map['message'] = message;
    map['statusCode'] = statusCode;
    return map;
  }
}

/// id : "cs_test_a1Ml8vxaZewg7AoiqUyec0BxTbCzl4ZUpOIvQMH9BAhXjBVjW6M9XvvXeS"
/// object : "checkout.session"
/// after_expiration : null
/// allow_promotion_codes : null
/// amount_subtotal : 2999
/// amount_total : 2999
/// billing_address_collection : null
/// cancel_url : "https://www.yahoo.com/"
/// client_reference_id : "66230f7fb02fc754832367ee"
/// client_secret : null
/// consent : null
/// consent_collection : null
/// created : 1713573762
/// currency : "usd"
/// currency_conversion : null
/// custom_fields : []
/// customer : null
/// customer_creation : "if_required"
/// customer_email : "yehya404@gmail.com"
/// expires_at : 1713660162
/// invoice : null
/// livemode : false
/// locale : null
/// mode : "payment"
/// payment_intent : null
/// payment_link : null
/// payment_method_collection : "if_required"
/// payment_method_configuration_details : null
/// payment_status : "unpaid"
/// recovered_from : null
/// saved_payment_method_options : null
/// setup_intent : null
/// shipping_address_collection : null
/// shipping_cost : null
/// shipping_details : null
/// shipping_options : []
/// status : "open"
/// submit_type : null
/// subscription : null
/// success_url : "https://www.google.com/"
/// ui_mode : "hosted"
/// url : "https://checkout.stripe.com/c/pay/cs_test_a1Ml8vxaZewg7AoiqUyec0BxTbCzl4ZUpOIvQMH9BAhXjBVjW6M9XvvXeS#fidkdWxOYHwnPyd1blpxYHZxWjA0VTIxXzVXc19EUlR3Njx8TVxtRm9mcDNHPDBIYzc1MGxyU3dtR25rbUt3PVNANE1VVnQzb3RUbD1zMVRtaTxVQXQ0ZEx3cVNMSkxEZDI8UX88bmRRUD19NTVDRnwwVWI0TCcpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl"
