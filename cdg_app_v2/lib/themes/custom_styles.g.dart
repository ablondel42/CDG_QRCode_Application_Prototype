import 'package:flutter/material.dart';

ButtonStyle customButtonStyle(BuildContext context) => TextButton.styleFrom(
      elevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      side: const BorderSide(
        color: Color.fromARGB(255, 45, 167, 86),
        width: 1.42,
      ),
      backgroundColor: const Color.fromARGB(19, 12, 210, 35),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    );

ButtonStyle customButtonStyleAlt(BuildContext context) => TextButton.styleFrom(
      elevation: 2,
      side: BorderSide(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        width: 1.42,
      ),
      backgroundColor: const Color.fromARGB(42, 12, 210, 35),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    );
