import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';
import 'package:foodies_app/domain/usecase/get_primary_delivery_address_use_case.dart';
import 'package:foodies_app/domain/usecase/get_promotions_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/Promotion.dart';
import '../../../../domain/usecase/get_all_delivery_addressess_use_case.dart';
import '../../../../domain/usecase/get_categories_use_case.dart';
import '../../../../domain/usecase/get_restaurants_use_case.dart';
import '../../../../domain/usecase/update_delivery_address_use_case.dart';
import 'home_states.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabState> {
  GetRestaurantsUsecase getRestaurantsUsecase;
  GetCategoriesUsecase getCategoriesUsecase;
  GetPromotionsUseCase getPromotionsUseCase;
  GetPrimaryDeliveryAddressUseCase getPrimaryDeliveryAddressUseCase;
  GetAllDeliveryAddressessUseCase getAllDeliveryAddressesUseCase;
  UpdateDeliveryAddressUseCase updateDeliveryAddressUseCase;

  List<DeliveryAddress> addresses = [];
  List<Promotion>? promotions;
  DeliveryAddress? primaryAddress;

  @factoryMethod
  HomeTabViewModel(
      this.getRestaurantsUsecase,
      this.getCategoriesUsecase,
      this.getPrimaryDeliveryAddressUseCase,
      this.getAllDeliveryAddressesUseCase,
      this.updateDeliveryAddressUseCase,
      this.getPromotionsUseCase)
      : super(InitialState());

  static HomeTabViewModel get(context) => BlocProvider.of(context);

  initPage() async {
    emit(LoadingState('Loading.....'));
    try {
      var restaurants = await getRestaurantsUsecase.invoke();
      var categories = await getCategoriesUsecase.invoke();
      var deliveryAddresses = await getAllDeliveryAddressesUseCase.invoke();
      var promotionsResponse = await getPromotionsUseCase.invoke();
      deliveryAddresses.fold((l) {
        emit(GetAllDeliveryAddressesErrorState(error: l.errorMessage));
      }, (r) {
        addresses = r;
        if (addresses.isNotEmpty) {
          primaryAddress =
              addresses.firstWhere((element) => element.isPrimary == true);
        }
        emit(GetAllDeliveryAddressesSuccessState(
            allDeliveryAddresses: addresses));
      });
      promotionsResponse.fold((l) {
        emit(GetAllPromotionsErrorState(error: l.errorMessage));
      }, (r) {
        promotions = r;
        emit(GetAllPromotionsSuccessState(promotion: promotions));
      });
      emit(SuccessState(
          restaurants: restaurants,
          categories: categories,
          promotions: promotions));
    } catch (e) {
      print(e);
      emit(ErrorState(e.toString()));
    }
  }

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



