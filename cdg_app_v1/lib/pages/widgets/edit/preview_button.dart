// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class PreviewButton extends StatelessWidget {
  const PreviewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.tertiaryContainer,
          )),
          icon: Icon(
            Icons.remove_red_eye_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
          onPressed: () {}, /// TODO: Link with a page to preview the card.
        ),
        Text(
          'Preview',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
