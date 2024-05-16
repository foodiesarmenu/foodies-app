import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../profile_tab/settings/my_addresses/maps/map_screen.dart';
import '../cubit/home_states.dart';
import '../cubit/home_tab_view_model.dart';

class DeliveryAddressBottomSheet extends StatefulWidget {
  const DeliveryAddressBottomSheet({required this.viewModel, super.key});

  final HomeTabViewModel viewModel;

  @override
  State<DeliveryAddressBottomSheet> createState() =>
      _DeliveryAddressBottomSheetState();
}

class _DeliveryAddressBottomSheetState
    extends State<DeliveryAddressBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel,HomeTabState>(
      bloc: widget.viewModel,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose delivery location',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      // Address
                      ListView.separated(
                          shrinkWrap: true,itemBuilder: (context, index) => InkWell(
                        onTap: () {

                          if(widget.viewModel.addresses[index].isPrimary == false)
                          widget.viewModel.setPrimaryAddress(addressId: widget.viewModel.addresses[index].id ?? '',isPrimary: true);
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.viewModel.addresses[index].firstAddress}',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),

                                    Text(
                                      'St ${widget.viewModel.addresses[index].streetName}, '
                                          'Building ${widget.viewModel.addresses[index].buildingNumber}, '
                                          '${widget.viewModel.addresses[index].floorNumber == null ? 'Floor ${widget.viewModel.addresses[index].floorNumber}, ' : ''}'
                                          'Apt ${widget.viewModel.addresses[index].apartmentNumber}',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)

                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.grey),
                                    ),
                                  ]),
                            ),
                            if(widget.viewModel.addresses[index].isPrimary == true)
                              Icon(
                              Icons.check_circle,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 16,
                          ),
                          itemCount: widget.viewModel.addresses.length),


                      SizedBox(
                        height: 16,
                      ),

                      //Different Address
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed(MapScreen.routeName);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_location_alt_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Deliver to different location',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    Text(
                                      'Choose a different address',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.grey),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

      },
    );
  }
}
