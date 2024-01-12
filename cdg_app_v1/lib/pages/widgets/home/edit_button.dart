import 'package:cdg_app_v1/pages/edit.dart';
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.userData});

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
          color: Theme.of(context).colorScheme.secondary,
          icon: Icon(
            Icons.mode_edit_outline_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
          onPressed: () {
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(userData: userData),
                ),
              );
            }
          },
        ),
        Text(
          'Edit',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
