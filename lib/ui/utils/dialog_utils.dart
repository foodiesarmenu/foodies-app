import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            content: Row(
              children: [
                CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor),
                Text('  $message'),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      {String? title,
      String? posActionName,
      VoidCallback? posAction,
      String? negActionName,
      VoidCallback? negAction,
      bool barrierDismissible = true}) {
    List<Widget> action = [];
    if (posActionName != null) {
      action.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName,
              style: const TextStyle(color: Colors.white))));
    }
    if (negActionName != null) {
      action.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName)));
    }
    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            content: Text('  $message'),
            title: Text(title ?? "title",
                style: const TextStyle(color: Colors.white)),
            actions: action,
          );
        });
  }
}
