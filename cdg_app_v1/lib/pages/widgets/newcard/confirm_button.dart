import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConfirmButton extends StatefulWidget {
  const ConfirmButton({super.key, required this.userData, required this.formKey});

  final UserData userData;
  final GlobalKey<FormState> formKey;

  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
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
            Icons.done_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
          onPressed: () {
            if (kDebugMode) {
              print('CONFIRM: ${widget.userData}');
            }

            // This is how you validate a from with "GlobalKey<FormState>"
            // This is just an example of how to show a snackbar and push
            // a new page.

            // if (widget.formKey.currentState!.validate()) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('Processing Data')),
            //   );
            //   if (context.mounted) {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => HomePage(userData: widget.userData),
            //       ),
            //     );
            //   }
            // }
          },
        ),
        Text(
          'Confirm',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
