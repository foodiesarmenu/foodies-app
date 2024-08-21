import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 2.sp),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.sp),
              color: Colors.white,
            ),
            child: Icon(
              Icons.location_on_outlined,
              color: Theme.of(context).primaryColor,
              size: 24.sp,
            ),
          ),
          SizedBox(
            width: 16.sp,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Delivering to',
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  onTap: () async {
                    showDeliveryAddressBottomSheet(widget.homeTabViewModel);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.homeTabViewModel.primaryAddress
                                  ?.firstAddress ??
                              'No Address Defined',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 24.sp,
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
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return DeliveryAddressBottomSheet(viewModel: homeTabViewModel);
      },
    );
  }
}
