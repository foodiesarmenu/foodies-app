class PaymentIntentInputModel {
  final double amount;
  final String currency;

  PaymentIntentInputModel({required this.amount, required this.currency});

  toJson() {
    int amountInCents = (amount * 100).toInt();

    return {
      'amount': amountInCents.toString(),
      'currency': currency,
    };
  }
}
