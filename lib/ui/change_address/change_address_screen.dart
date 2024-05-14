import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/change_address/cubit/change_address_states.dart';
import '../../di/di.dart';
import '../checkout/address_details_widget.dart';
import '../home/profile_tab/settings/my_addresses/maps/map_screen.dart';
import 'cubit/change_address_view_model.dart';

class ChangeAddressScreen extends StatelessWidget {
  ChangeAddressScreen({super.key,this.refreshPrimaryAddress});
  final Function()? refreshPrimaryAddress;
  static const String routeName = '/change_address_screen';

final viewModel = getIt<ChangeAddressScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getAllAddresses(),
      child: BlocBuilder<ChangeAddressScreenViewModel,ChangeAddressStates>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Addresses'),
              ),
              body: (state is GetAllAddressesSuccessState) ?
              SingleChildScrollView(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: viewModel.addresses.length,
                        itemBuilder: (context, index) {
                          return AddressDetailsWidget(
                              address: viewModel.addresses[index],
                            isChangeAddress: true,
                            refreshAddress : refreshPrimaryAddress,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                    ],
                  ),
                ),
              ) : const Center(child: CircularProgressIndicator()),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pushNamed(MapScreen.routeName);
                },
                child: const Icon(Icons.add, color: Colors.white),
              ));
        },
      ),
    );
  }
}
