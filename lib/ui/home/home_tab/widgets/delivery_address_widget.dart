import 'package:flutter/material.dart';
import '../cubit/home_tab_view_model.dart';
import 'delivery_address_bottom_sheet.dart';

class DeliveryAddressWidget extends StatefulWidget {
  const DeliveryAddressWidget({required this.homeTabViewModel});

  final HomeTabViewModel homeTabViewModel;

  @override
  State<DeliveryAddressWidget> createState() => _DeliveryAddressWidgetState();
}

class _DeliveryAddressWidgetState extends State<DeliveryAddressWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
      child: Row(

        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
            ),
            child: Icon(
              Icons.location_on_outlined,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivering to',style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${widget.homeTabViewModel.primaryAddress?.firstAddress ?? 'No Address Defined'}',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          showDeliveryAddressBottomSheet(widget.homeTabViewModel);
                        },
                        child: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showDeliveryAddressBottomSheet(HomeTabViewModel homeTabViewModel) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return  DeliveryAddressBottomSheet(viewModel : homeTabViewModel);
        }
        );
  }
}
