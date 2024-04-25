/// allow_redirects : "always"
/// enabled : true

class AutomaticPaymentMethods {
  AutomaticPaymentMethods({
    this.allowRedirects,
    this.enabled,
  });

  AutomaticPaymentMethods.fromJson(dynamic json) {
    allowRedirects = json['allow_redirects'];
    enabled = json['enabled'];
  }

  String? allowRedirects;
  bool? enabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['allow_redirects'] = allowRedirects;
    map['enabled'] = enabled;
    return map;
  }
}
