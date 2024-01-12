// ignore_for_file: avoid_print
import 'package:cdg_app_v1/pages/qrpage.dart';
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/material.dart';

class ViewButton extends StatelessWidget {
  const ViewButton({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.tertiaryContainer,
          )),
          icon: Icon(
            Icons.qr_code_2_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
          onPressed: () {
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QrPage(userData: userData),
                ),
              );
            }
          },
        ),
        Text(
          'View',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
