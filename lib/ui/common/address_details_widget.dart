import 'package:flutter/material.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';

import '../../domain/model/User.dart';
import '../change_address/cubit/change_address_view_model.dart';

class AddressDetailsWidget extends StatelessWidget {
  const AddressDetailsWidget(
      {this.address,
      this.user,
      this.isChangeAddress = false,
      super.key,
      this.refreshAddress});

  final bool isChangeAddress;
  final DeliveryAddress? address;
  final Function? refreshAddress;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .5),
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //Delivery Address Details
        children: [
          (!isChangeAddress)
              ? Text('Delivery Address Details',
                  style: Theme.of(context).textTheme.titleMedium)
              : Text(user?.name ?? '',
                  style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(Icons.house_outlined, color: Colors.grey),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                    '${address?.firstAddress ?? ''} ${address?.secondAddress ?? ''}',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Colors.grey),
              const SizedBox(
                width: 16,
              ),
              if (address != null)
                Expanded(
                  child: Text(
                    'St ${address?.streetName}, '
                    'Building ${address?.buildingNumber}, '
                    '${address?.floorNumber == null ? 'Floor ${address?.floorNumber}, ' : ''}'
                    'Apt ${address?.apartmentNumber}',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Icon(
                Icons.phone_outlined,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                user?.phoneNumber ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          if (isChangeAddress)
            const SizedBox(
              height: 32,
            ),
          if (isChangeAddress)
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              address?.isPrimary != true
                  ? InkWell(
                      onTap: () {
                        ChangeAddressScreenViewModel.get(context)
                            .setPrimaryAddress(
                                addressId: address?.id ?? '', isPrimary: true)
                            .then((_) {
                          refreshAddress!();
                        });
                      },
                      child: Text(
                        'Set as Primary',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    )
                  : Text(
                      'Primary',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      ChangeAddressScreenViewModel.get(context)
                          .deleteAddress(id: address?.id ?? '')
                          .then((_) {
                        refreshAddress!();
                      });
                    },
                    child: Text('Delete',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                  const SizedBox(width: 16),
                  Text('Edit', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ]),
        ],
      ),
    );
  }
}
