import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';
import 'package:foodies_app/domain/usecase/get_primary_delivery_address_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/Category.dart';
import '../../../../domain/model/Restaurant.dart';
import '../../../../domain/usecase/GetCategoriesUsecase.dart';
import '../../../../domain/usecase/GetRestaurantsUsecase.dart';
import '../../../../domain/usecase/get_all_delivery_addressess_use_case.dart';
import '../../../../domain/usecase/update_delivery_address_use_case.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabState> {
  GetRestaurantsUsecase getRestaurantsUsecase;
  GetCategoriesUsecase getCategoriesUsecase;
  GetPrimaryDeliveryAddressUseCase getPrimaryDeliveryAddressUseCase;
  GetAllDeliveryAddressessUseCase getAllDeliveryAddressesUseCase;
  UpdateDeliveryAddressUseCase updateDeliveryAddressUseCase;

  List<DeliveryAddress> addresses = [] ;
  DeliveryAddress? primaryAddress ;

  @factoryMethod
  HomeTabViewModel(this.getRestaurantsUsecase,
      this.getCategoriesUsecase,
      this.getPrimaryDeliveryAddressUseCase,
      this.getAllDeliveryAddressesUseCase,
      this.updateDeliveryAddressUseCase)
      : super(LoadingState('Loading...'));

  static HomeTabViewModel get(context) => BlocProvider.of(context);

  initPage() async {
    emit(LoadingState('Loading.....'));
    try {
      var restaurants = await getRestaurantsUsecase.invoke();
      var categories = await getCategoriesUsecase.invoke();
      // var primaryDeliveryAddress = await getPrimaryDeliveryAddressUseCase.invoke();
      var deliveryAddresses = await getAllDeliveryAddressesUseCase.invoke();
      // primaryDeliveryAddress.fold((l) {
      //   emit(GetPrimaryDeliveryAddressErrorState(error: l.errorMessage));
      // }, (r) {
      //   primaryAddress = r;
      //   emit(GetPrimaryDeliveryAddressSuccessState(primaryDeliveryAddress: r));
      // },);
      deliveryAddresses.fold((l) {
        emit(GetAllDeliveryAddressesErrorState(error: l.errorMessage));
      }, (r) {
        addresses = r;
        if(addresses.isNotEmpty){
          primaryAddress = addresses.firstWhere((element) => element.isPrimary == true);
          print('Primary Address : $primaryAddress');
        }
        emit(GetAllDeliveryAddressesSuccessState(allDeliveryAddresses: addresses));
      });
      emit(SuccessState(restaurants, categories));
    } catch (e) {
      print(e);
      emit(ErrorState(e.toString()));
    }
  }

  //  getAllDeliveryAddresses() async {
  //   var deliveryAddresses = await getAllDeliveryAddressesUseCase.invoke();
  //    deliveryAddresses.fold((l) {
  //     emit(GetAllDeliveryAddressesErrorState(error: l.errorMessage));
  //   }, (r) {
  //     addresses = r;
  //     emit(GetAllDeliveryAddressesSuccessState(allDeliveryAddresses: addresses));
  //     initPage();
  //   });
  // }

  setPrimaryAddress({required String addressId,required bool isPrimary}) async {
    var setPrimaryAddress = await updateDeliveryAddressUseCase.invoke(isPrimary: isPrimary,addressId : addressId);
    setPrimaryAddress.fold((l) {
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
      initPage();
    },);
  }

}



abstract class HomeTabState {}

class LoadingState extends HomeTabState {
  String message;

  LoadingState(this.message);
}

class ErrorState extends HomeTabState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class SuccessState extends HomeTabState {
  List<Restaurant>? restaurants;
  List<Category>? categories;

  SuccessState(this.restaurants, this.categories);
}

class GetPrimaryDeliveryAddressSuccessState extends HomeTabState {
  DeliveryAddress? primaryDeliveryAddress;

  GetPrimaryDeliveryAddressSuccessState({this.primaryDeliveryAddress});
}

class GetPrimaryDeliveryAddressErrorState extends HomeTabState {
  String? error;

  GetPrimaryDeliveryAddressErrorState({this.error});
}

class GetAllDeliveryAddressesSuccessState extends HomeTabState {
  List<DeliveryAddress>? allDeliveryAddresses;

  GetAllDeliveryAddressesSuccessState({this.allDeliveryAddresses});
}

class GetAllDeliveryAddressesErrorState extends HomeTabState {
  String? error;

  GetAllDeliveryAddressesErrorState({this.error});
}

class SetPrimaryAddressSuccessState extends HomeTabState {
}
class SetPrimaryAddressErrorState extends HomeTabState {
  String? error;

  SetPrimaryAddressErrorState({this.error});
}