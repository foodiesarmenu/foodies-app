import 'package:flutter/material.dart';

class SocialSignInOptions extends StatelessWidget {
  const SocialSignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Or connect with',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/google_icon.png'),
            Image.asset('assets/images/facebook_icon.png'),
          ],
        ),
      ],
    );
  }
}
