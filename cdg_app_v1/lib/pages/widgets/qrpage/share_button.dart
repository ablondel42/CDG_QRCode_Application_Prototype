// ignore_for_file: avoid_print
import 'package:cdg_app_v1/pages/utils/globals.dart';
import 'package:cdg_app_v1/services/qrcode_utils.dart';
import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

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
            Icons.share_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 30,
          ),
          onPressed: () => captureAndShareWidgetImage(getWidgetImageKey),
        ),
        Text(
          'Share',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
