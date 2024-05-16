import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/home/home_tab/widgets/promotion_widget.dart';
import '../../../di/di.dart';
import '../../search/seach_screen.dart';
import 'cubit/home_states.dart';
import 'widgets/category_list.dart';
import 'cubit/home_tab_view_model.dart';
import 'widgets/app_search_bar.dart';
import 'widgets/delivery_address_widget.dart';
import 'widgets/restaurant_list.dart';
import 'widgets/section_title_widget.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'HomeSc';

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var viewModel = getIt<HomeTabViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<HomeTabViewModel, HomeTabState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return const Center(child: CircularProgressIndicator());
            case ErrorState:
              return Column(
                children: [
                  Text((state as ErrorState).errorMessage),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.initPage();
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              );
            case SuccessState:
              final successState = state as SuccessState;

              return CustomScrollView(
                        slivers: <Widget>[

                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            pinned: false,
                            floating: false,
                            backgroundColor: Theme.of(context).primaryColor,
                            actions: [
                              Expanded(

                                child: DeliveryAddressWidget(homeTabViewModel : viewModel),
                              ),
                            ],
                          ),
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            pinned: true,
                            floating: true,
                            backgroundColor: Theme.of(context).primaryColor,
                            actions: [
                              Expanded(
                                child: AppSearchBar(
                                        onPressed: () {
                                          showSearch(
                                            context: context,
                                            delegate: SearchScreen(restaurants: successState.restaurants),
                                          );
                                        },
                              ),
                              ),
                            ],
                          ),
                          // SliverPersistentHeader(
                          //   pinned: false,
                          //   floating: false,
                          //   delegate: _SearchAppBarDelegate(
                          //     child: Container(
                          //       color: Theme.of(context).primaryColor,
                          //       child: Padding(
                          //         padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          //         child: AppSearchBar(
                          //           onPressed: () {
                          //             showSearch(
                          //               context: context,
                          //               delegate: SearchScreen(),
                          //             );
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SliverPadding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            sliver: SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  const SectionTitleWidget(
                                    title: 'Category',
                            subtitle: 'Discover different categories',
                          ),
                          const SizedBox(height: 8),
                          CategoryList(successState.categories ?? []),
                          const Divider(),
                          const SectionTitleWidget(
                            title: 'Promotions',
                            subtitle: 'Wide range of promotions just for you',
                          ),
                          const SizedBox(height: 8),
                          PromotionWidget(successState.promotions ?? []),
                          const Divider(),
                          const SectionTitleWidget(
                            title: 'Restaurants',
                            subtitle: 'Explore various restaurants',
                          ),
                          const SizedBox(height: 8),
                          RestaurantList(successState.restaurants ?? []),
                        ],
                              ),
                            ),
                          ),
                ],
              );
          }
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
// class _SearchAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SearchAppBarDelegate({   this.expandedHeight,
//     this.backgroundColor,
//     required this.child});
//   final double? expandedHeight;
//   final Color? backgroundColor;
//
//   final Widget child;
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox.expand(child: child);
//   }
//
//   @override
//   double get maxExtent => expandedHeight ?? kToolbarHeight;
//
//   @override
//   double get minExtent => kToolbarHeight;
//
//   @override
//   bool shouldRebuild(_SearchAppBarDelegate oldDelegate) {
//     return false;
//   }
// }
