/// tip : {}

class AmountDetails {
  AmountDetails({
    this.tip,
  });

  AmountDetails.fromJson(dynamic json) {
    tip = json['tip'];
  }

  dynamic tip;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tip'] = tip;
    return map;
  }
}
