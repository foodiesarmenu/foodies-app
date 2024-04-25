import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:foodies_app/data/api_manager.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/request/payment_intent_input_model.dart';
import '../../domain/model/InitPaymentSheetInputModel.dart';

@injectable
class StripeService {
  ApiManager apiManager;

  @factoryMethod
  StripeService(this.apiManager);

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'Yungy',
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,

        style: ThemeMode.dark,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentResult = await apiManager.createPaymentIntent(
      amount: paymentIntentInputModel.amount,
      currency: paymentIntentInputModel.currency,
    );
    return paymentIntentResult.fold(
      (failure) {
        print('Failed to create payment intent: ${failure.errorMessage}');
        return false;
      },
      (paymentIntentModel) async {
        var initPaymentSheetInputModel = InitPaymentSheetInputModel(
          clientSecret: paymentIntentModel.clientSecret ?? '',
          customerId: '',
          ephemeralKeySecret: '',
        );
        await initPaymentSheet(
            initPaymentSheetInputModel: initPaymentSheetInputModel);
        await displayPaymentSheet();
        return true;
      },
    );
  }
}
