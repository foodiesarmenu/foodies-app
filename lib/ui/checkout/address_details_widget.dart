import 'package:flutter/material.dart';

class AddressDetailsWidget extends StatelessWidget {
  const AddressDetailsWidget({this.isChangeAddress = false, super.key});

  final bool isChangeAddress;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //Delivery Address Details
          children: [
            (!isChangeAddress)
                ? Text('Delivery Address Details',
                    style: Theme.of(context).textTheme.titleMedium)
                : Text('Yehya Gamal',
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
                  child: Text('Sidi Bishr, Alexandria, Egypt',
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
                Expanded(
                  child: Text(
                    '17St Magd El Arb Sedii Bshr Bahrii, 17 Building, 3rd Flood,Apartment 3',
                    style: Theme.of(context).textTheme.bodySmall,
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
                  '01144416288',
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
                Text(
                  'Primay',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
                Row(
                  children: [
                    Text('Delete',
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(width: 16),
                    Text('Edit', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ]),
          ],
        ),
      ),
    );
  }
}
