// ignore_for_file: avoid_print

import 'package:cdg_app_v1/services/qrcode_utils.dart';
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.userData});

  final UserData userData;

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
            Icons.person_add_alt_1_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 30,
          ),
          onPressed: () => addEmployeeToContacts(userData),
        ),
        Text(
          'Add',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
