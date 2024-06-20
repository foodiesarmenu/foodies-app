import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/request/PaymentIntentInputModel.dart';
import '../../../domain/model/DeliveryAddress.dart';
import '../../../domain/model/User.dart';
import '../../../domain/usecase/create_cash_order_use_case.dart';
import '../../../domain/usecase/create_online_order_use_case.dart';
import '../../../domain/usecase/get_primary_delivery_address_use_case.dart';
import '../../../domain/usecase/get_profile_data_use_case.dart';
import '../../../domain/usecase/make_payment_use_case.dart';
import '../../utils/shared_preference_utils.dart';
import 'checkout_states.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckoutStates> {
  CreateOnlineOrderUseCase createOnlineOrderUseCase;
  CreateCashOrderUseCase createCashOrderUseCase;
  MakePaymentUseCase makePaymentUseCase;
GetPrimaryDeliveryAddressUseCase getPrimaryDeliveryAddressUseCase;
  GetProfileDataUseCase getProfileDataUseCase;

  @factoryMethod
  CheckoutViewModel(this.createOnlineOrderUseCase, this.createCashOrderUseCase,
      this.makePaymentUseCase,
      this.getPrimaryDeliveryAddressUseCase,
      this.getProfileDataUseCase)
      : super(MakePaymentInitialState());

  static CheckoutViewModel get(context) => BlocProvider.of(context);
DeliveryAddress? address ;

  User? user;
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
    final either =
        await createOnlineOrderUseCase.invoke(deliveryAddress: deliveryAddress);
    either.fold((failure) {
      emit(CreateOnlineOrderErrorState(errorMessage: failure));
    }, (onlineOrder) {
      emit(CreateOnlineOrderSuccessState(onlineOrderPayment: onlineOrder));
      SharedPreferenceUtils.removeData(key: 'numOfCartItems');
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
      SharedPreferenceUtils.removeData(key: 'numOfCartItems');
    });
  }

  getPrimaryAddress() async {
    var primaryDeliveryAddress = await getPrimaryDeliveryAddressUseCase.invoke();
    primaryDeliveryAddress.fold((l) {
      print(l.errorMessage);
      emit(GetPrimaryDeliveryAddressErrorState(error: l.errorMessage));
    }, (r) {
      address = r;
      emit(GetPrimaryDeliveryAddressSuccessState(primaryDeliveryAddress: r));
    },);
  }

  getUserData() async {
    var userData = await getProfileDataUseCase.invoke();
    userData.fold(
      (l) {
        emit(GetUserDataErrorState(error: l.errorMessage));
      },
      (r) {
        user = r;
        emit(GetUserDataSuccessState(user: r));
      },
    );
  }
}
