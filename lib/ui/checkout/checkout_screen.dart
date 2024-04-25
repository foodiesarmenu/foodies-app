import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';
import 'package:foodies_app/ui/cart/payment_details_widget.dart';
import 'package:foodies_app/ui/cart/restaurant_info_widget.dart';
import 'package:foodies_app/ui/checkout/cubit/checkout_states.dart';
import 'package:foodies_app/ui/checkout/cubit/checkout_view_model.dart';

import '../../data/model/request/payment_intent_input_model.dart';
import '../../di/di.dart';
import '../../domain/model/Cart.dart';
import '../utils/shared_preference_utils.dart';
import 'address_details_widget.dart';
import 'ordering_splash_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  static const String routeName = '/checkout';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String paymentMethod = 'Click to choose payment method';
  Cart? args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as Cart?;
    var viewModel = getIt<CheckoutViewModel>();

    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<CheckoutViewModel, CheckoutStates>(
          bloc: viewModel,
          listener: (context, state) {
            print('Big State $state');
            if (state is MakePaymentSuccessState) {
              viewModel.createOnlineOrder(
                deliveryAddress: DeliveryAddress(
                  firstAddress: "123 Main St222222",
                  secondAddress: "Apt 1012222",
                  buildingNumber: "Building A22",
                  streetName: "Oak Avenue22",
                  floorNumber: "2nd Floor222",
                  apartmentNumber: "10122",
                  note: "Near the park2",
                ),
              );
              Navigator.pushReplacementNamed(
                  context, OrderingSplashScreen.routeName);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Checkout'),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    children: [
                      RestaurantInfoWidget(cart: args, isCart: false),
                      const SizedBox(height: 4),
                      const AddressDetailsWidget(),
                      const SizedBox(height: 8),
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(
                              'Pay with',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              paymentMethod,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            contentPadding: const EdgeInsets.all(0),
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: const Text('Cash'),
                                        onTap: () {
                                          setState(() {
                                            Navigator.pop(context);
                                            paymentMethod = 'Cash';
                                          });
                                        },
                                      ),
                                      ListTile(
                                        title: const Text('Card'),
                                        onTap: () {
                                          setState(() {
                                            Navigator.pop(context);
                                            paymentMethod = 'Card';
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      PaymentDetailsWidget(cart: args),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    if (paymentMethod == 'Cash') {
                      viewModel.createCashOrder(
                        deliveryAddress: DeliveryAddress(
                          firstAddress: "123 Main St222222",
                          secondAddress: "Apt 1012222",
                          buildingNumber: "Building A22",
                          streetName: "Oak Avenue22",
                          floorNumber: "2nd Floor222",
                          apartmentNumber: "10122",
                          note: "Near the park2",
                        ),
                      );
                      Navigator.pushReplacementNamed(
                          context, OrderingSplashScreen.routeName,
                          arguments: args);
                      SharedPreferenceUtils.saveData(
                          key: 'isOrdering', value: true);
                    } else if (paymentMethod == 'Card') {
                      print('Small State $state');
                      await viewModel.makePayment(
                        paymentIntentInputModel: PaymentIntentInputModel(
                            amount: args?.cartTotalPrice.toString() ?? '',
                            currency: 'EGP'),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please choose payment method'),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Place order',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
