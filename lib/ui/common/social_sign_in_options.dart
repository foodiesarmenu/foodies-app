import 'package:flutter/material.dart';

class SocialSignInOptions extends StatelessWidget {
  const SocialSignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Or connect with',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.facebook_outlined,
              size: 32,
            ),
            Icon(
              Icons.email_outlined,
              size: 32,
            ),
          ],
        ),
      ],
    );
  }
}
