import 'package:flutter/material.dart';

typedef OnButtonPressed = void Function();

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {this.title,
      this.subTitle,
      required this.onPressed,
      this.isCart = false,
      this.isCheckOut = false,
      this.isMealDetail = false,
      this.isScanner,
      super.key});

  final String? title;
  final String? subTitle;
  final OnButtonPressed onPressed;
  final bool? isCheckOut;
  final bool? isScanner;
  final bool? isCart;
  final bool? isMealDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
            isCart == true
                ? const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                : isCheckOut == true
                    ? const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    : isMealDetail == true
                        ? Text(subTitle!,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Colors.white,
                                ))
                        : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
