import 'package:flutter/material.dart';
import 'package:foodies_app/ui/home_tab/promotions/promotion_card.dart';

class PromotionList extends StatefulWidget {
  const PromotionList({super.key});

  @override
  State<PromotionList> createState() => _PromotionListState();
}

class _PromotionListState extends State<PromotionList> {
  @override
  Widget build(BuildContext context) {
    return PromotionCard();
  }
}
