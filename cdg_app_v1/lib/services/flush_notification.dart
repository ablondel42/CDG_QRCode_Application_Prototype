import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

/// Flushbar from the plugin "another_flushbar". it displays a styled message to the user.
/// It can be customized further to handle success, error, informational messages.
Flushbar<dynamic> flushNotification(BuildContext context, String title, String message) {
  return Flushbar(
    title: title,
    message: message,
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    leftBarIndicatorColor: Colors.greenAccent.shade200,
    borderColor: Colors.greenAccent.shade200,
    showProgressIndicator: true,
    backgroundGradient: LinearGradient(colors: [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary
    ]),
    icon: Icon(
      Icons.downloading,
      size: 32,
      color: Colors.greenAccent.shade200,
    ),
  );
}
