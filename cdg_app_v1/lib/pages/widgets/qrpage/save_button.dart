import 'package:cdg_app_v1/pages/utils/globals.dart';
import 'package:cdg_app_v1/services/qrcode_utils.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

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
            Icons.downloading_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
          onPressed: () {
            captureAndDownloadWidgetImage(getWidgetImageKey);
          },
        ),
        Text(
          'Save',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
