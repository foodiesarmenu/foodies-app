import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';
import 'package:foodies_app/domain/usecase/add_delivery_address_use_case.dart';
import 'package:injectable/injectable.dart';
import 'form_address_states.dart';

@injectable
class FormAddressViewModel extends Cubit<FormAddressStates> {
  AddDeliveryAddressUseCase addDeliveryAddressUseCase;
  @factoryMethod
  FormAddressViewModel(this.addDeliveryAddressUseCase) : super(DeliveryAddressInitialState());

  static FormAddressViewModel get(context) => BlocProvider.of(context);
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController firstAddressController = TextEditingController();
  TextEditingController buildingNoController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController floorNoController = TextEditingController();
  TextEditingController apartmentNoController = TextEditingController();
  TextEditingController othersController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  addAddress() async {
    if (formKey.currentState!.validate()) {
      emit(AddAddressLoadingState(loadingMessage: 'loading...'));
      var addAddress = await addDeliveryAddressUseCase.invoke(
          deliveryAddress: DeliveryAddress(
            firstAddress: firstAddressController.text,
            secondAddress: " ",
            buildingNumber: buildingNoController.text,
            streetName: streetNameController.text,
            floorNumber: floorNoController.text ?? " ",
            apartmentNumber: apartmentNoController.text,
            note: othersController.text,
            isPrimary: true,
          ));
      addAddress.fold((l) {
        print(l.errorMessage);
        emit(AddAddressErrorState(error: l.errorMessage));
      }, (r) {
        emit(AddAddressSuccessState(deliveryAddress: r));
      },);
    }
  }
}
