import 'package:cdg_app_v1/pages/widgets/edit/cancel_button.dart';
import 'package:cdg_app_v1/pages/widgets/edit/preview_button.dart';
import 'package:cdg_app_v1/pages/widgets/qrpage/save_button.dart';
import 'package:cdg_app_v1/services/database.dart';
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/material.dart';
import 'widgets/components/appbar.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.userData});

  final UserData userData;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late List<UserData> mainUserCards = [];
  late TextEditingController firstNameController = TextEditingController(text: widget.userData.firstName);
  late TextEditingController lastNameController = TextEditingController(text: widget.userData.lastName);
  late TextEditingController organizationController = TextEditingController(text: widget.userData.organization);
  late TextEditingController titleController = TextEditingController(text: widget.userData.title);
  late TextEditingController emailController = TextEditingController(text: widget.userData.email);
  late TextEditingController landPhoneController = TextEditingController(text: widget.userData.landPhone);
  late TextEditingController mobilePhoneController = TextEditingController(text: widget.userData.mobilePhone);
  late TextEditingController faxController = TextEditingController(text: widget.userData.fax);
  late TextEditingController streetController = TextEditingController(text: widget.userData.street);
  late TextEditingController cityController = TextEditingController(text: widget.userData.city);
  late TextEditingController regionController = TextEditingController(text: widget.userData.region);
  late TextEditingController postcodeController = TextEditingController(text: widget.userData.postcode);
  late TextEditingController countryController = TextEditingController(text: widget.userData.country);
  late TextEditingController urlController = TextEditingController(text: widget.userData.url);

  @override
  void initState() {
    super.initState();
    getCards();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getCards() async {
    final cards = await DatabaseProvider().getMainUserCards();
    if (mounted) {
      setState(() {
        mainUserCards = cards;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Builder(builder: (context) {
          return const Appbar(title: 'Edit', showBackButton: true);
        }),
      ),
      body: SafeArea(
        top: true,
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Material(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.2),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(4.2),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Material(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.2),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.background,
                                    borderRadius: BorderRadius.circular(4.2),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.background,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                            child: ListView(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              children: <Widget>[
                                                FormField(controller: firstNameController, label: 'First name'),
                                                FormField(controller: lastNameController, label: 'Last name'),
                                                FormField(controller: organizationController, label: 'Organization'),
                                                FormField(controller: titleController, label: 'Job title'),
                                                FormField(controller: emailController, label: 'Email'),
                                                FormField(controller: landPhoneController, label: 'Telephone'),
                                                FormField(controller: mobilePhoneController, label: 'Mobile'),
                                                FormField(controller: faxController, label: 'Fax'),
                                                FormField(controller: streetController, label: 'Street'),
                                                FormField(controller: cityController, label: 'City'),
                                                FormField(controller: regionController, label: 'Region'),
                                                FormField(controller: postcodeController, label: 'Postcode'),
                                                FormField(controller: countryController, label: 'Country'),
                                                FormField(controller: urlController, label: 'Url'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            CancelButton(),
                                            PreviewButton(),
                                            SaveButton(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.labelMedium,
          hintStyle: Theme.of(context).textTheme.labelMedium,
        ),
        autofocus: false,
        obscureText: false,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.start,
        validator: (value) => value,
      ),
    );
  }
}
