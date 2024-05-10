import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/usecase/add_delivery_address_use_case.dart';
import 'package:foodies_app/domain/usecase/delete_delivery_address_use_case.dart';
import 'package:foodies_app/domain/usecase/get_all_delivery_addressess_use_case.dart';
import 'package:foodies_app/domain/usecase/update_delivery_address_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/model/DeliveryAddress.dart';
import 'change_address_states.dart';

@injectable
class ChangeAddressScreenViewModel extends Cubit<ChangeAddressStates> {
  AddDeliveryAddressUseCase addDeliveryAddressUseCase;
  DeleteDeliveryAddressUseCase deleteDeliveryAddressUseCase;
  GetAllDeliveryAddressessUseCase getAllDeliveryAddressesUseCase;
  UpdateDeliveryAddressUseCase updateDeliveryAddressUseCase;
  @factoryMethod
  ChangeAddressScreenViewModel(
      this.addDeliveryAddressUseCase,
      this.deleteDeliveryAddressUseCase,
      this.getAllDeliveryAddressesUseCase,
      this.updateDeliveryAddressUseCase)
      : super(DeliveryAddressInitialState());

  static ChangeAddressScreenViewModel get(context) => BlocProvider.of(context);
List<DeliveryAddress> addresses = [] ;

  getAllAddresses() async {
    var getAllAddresses = await getAllDeliveryAddressesUseCase.invoke();
    getAllAddresses.fold((l) {
      emit(GetAllAddressesErrorState(error: l.errorMessage));
    }, (r) {
      addresses = r;
      emit(GetAllAddressesSuccessState(allDeliveryAddress: r));
    },);
  }

 deleteAddress({required String id}) async {
    var deleteAddress = await deleteDeliveryAddressUseCase.invoke(id: id);
    deleteAddress.fold((l) {
      print(l.errorMessage);
      emit(DeleteAddressErrorState(error: l.errorMessage));
    }, (r) {
      addresses = addresses.where((element) => element.id != id).toList();
      emit(DeleteAddressSuccessState());
      emit(GetAllAddressesSuccessState(allDeliveryAddress: addresses));
    },);
  }

  setPrimaryAddress({required String addressId,required bool isPrimary}) async {
    var setPrimaryAddress = await updateDeliveryAddressUseCase.invoke(isPrimary: isPrimary,addressId : addressId);
    setPrimaryAddress.fold((l) {
      print(l.errorMessage);
      emit(SetPrimaryAddressErrorState(error: l.errorMessage));
    }, (r) {
      addresses = addresses.map((e) {
        if(e.id == addressId){
          e.isPrimary = true;
        }else{
          e.isPrimary = false;
        }
        return e;
      }).toList();
      emit(SetPrimaryAddressSuccessState());
      emit(GetAllAddressesSuccessState(allDeliveryAddress: addresses));
    },);
  }

}
