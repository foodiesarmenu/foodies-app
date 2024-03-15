import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromotionCard extends StatefulWidget {
  PromotionCard({super.key});

  final List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRloUp3D6lyiyF9J5_r3YvIYFDlr-EoAyMMhw-M3w_DfyYBOxGQpI40ZZMzDcyEMIwSrnc&usqp=CAU',
    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/6fccd6105043209.5f70a3521f5c6.png',
    'https://img.pikbest.com/origin/06/26/42/22JpIkbEsTPGe.jpg!bw700',
    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/6fccd6105043209.5f70a3521f5c6.png',
    'https://img.pikbest.com/origin/06/26/42/22JpIkbEsTPGe.jpg!bw700'
  ];

  @override
  State<PromotionCard> createState() => _PromotionCardState();
}

class _PromotionCardState extends State<PromotionCard> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: AnotherCarousel(
                images: widget.imageUrls.map((imageUrl) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.fill,
                    ),
                  );
                }).toList(),
                showIndicator: false,
                onImageChange: (prev, next) {
                  setState(() {
                    activeIndex = next;
                  });
                }),
          ),
          const SizedBox(height: 12),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: widget.imageUrls.length,
      effect: SlideEffect(
        activeDotColor: Theme.of(context).primaryColor,
        dotColor: Colors.grey,
        dotHeight: 20,
        dotWidth: 20,
        spacing: 8,
      ),
    );
  }
}
