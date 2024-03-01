import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: AnotherCarousel(
        images: const [
          AssetImage('assets/images/ice_volcano_logo.png'),
          AssetImage('assets/images/chicken_fila_logo.png'),
          AssetImage('assets/images/china_house_logo.png'),
        ],
        dotSize: 10,
        indicatorBgPadding: 5,
        dotColor: Colors.grey,
        dotBgColor: Colors.transparent,
        boxFit: BoxFit.cover,
        borderRadius: true,
        radius: const Radius.circular(16.0),
      ),
    );
  }
}
