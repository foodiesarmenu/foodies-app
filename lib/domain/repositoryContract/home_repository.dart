import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/model/response/payment_intent_model_response/PaymentIntentModel.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/request/payment_intent_input_model.dart';
import '../model/Category.dart';
import '../model/OrderEntity.dart';
import '../model/OnlineOrder.dart';
import '../model/Promotion.dart';
import '../model/Restaurant.dart';

abstract class HomeRepository {
  Future<List<Restaurant>?> getRestaurants({String? categoryId});

  Future<Either<Failures, List<Promotion>>> getAllPromotions();

  Future<List<Category>?> getCategories();
}
