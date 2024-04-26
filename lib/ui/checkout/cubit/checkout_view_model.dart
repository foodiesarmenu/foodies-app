import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/request/payment_intent_input_model.dart';
import '../../../domain/model/DeliveryAddress.dart';
import '../../../domain/usecase/create_cash_order_use_case.dart';
import '../../../domain/usecase/create_online_order_use_case.dart';
import '../../../domain/usecase/make_payment_use_case.dart';
import 'checkout_states.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckoutStates> {
  CreateOnlineOrderUseCase createOnlineOrderUseCase;
  CreateCashOrderUseCase createCashOrderUseCase;
  MakePaymentUseCase makePaymentUseCase;

  @factoryMethod
  CheckoutViewModel(this.createOnlineOrderUseCase, this.createCashOrderUseCase,
      this.makePaymentUseCase)
      : super(MakePaymentInitialState());

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(MakePaymentLoadingState());

    var data = await makePaymentUseCase.invoke(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold(
      (l) {
        print(l.errorMessage);
        emit(MakePaymentErrorState(errorMessage: l));
      },
      (r) => emit(
        MakePaymentSuccessState(),
      ),
    );
  }

  createOnlineOrder({required DeliveryAddress deliveryAddress}) async {
    emit(CreateOnlineOrderLoadingState(
        loadingMessage: 'Creating online order...'));
    final either =
        await createOnlineOrderUseCase.invoke(deliveryAddress: deliveryAddress);
    either.fold((failure) {
      emit(CreateOnlineOrderErrorState(errorMessage: failure));
    }, (onlineOrder) {
      emit(CreateOnlineOrderSuccessState(onlineOrderPayment: onlineOrder));
    });
  }

  createCashOrder({required DeliveryAddress deliveryAddress}) async {
    emit(CreateCashOrderLoadingState(
        loadingMessage: 'Creating online order...'));
    final either =
        await createCashOrderUseCase.invoke(deliveryAddress: deliveryAddress);
    either.fold(
        (failure) => emit(CreateCashOrderErrorState(errorMessage: failure)),
        (cashOrder) {
      emit(CreateCashOrderSuccessState(cashOrder: cashOrder));
    });
  }
}