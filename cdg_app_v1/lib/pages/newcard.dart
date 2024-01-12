import 'package:cdg_app_v1/pages/widgets/newcard/cancel_button.dart';
import 'package:cdg_app_v1/pages/widgets/newcard/confirm_button.dart';
import 'package:cdg_app_v1/pages/widgets/newcard/preview_button.dart';
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/material.dart';
import 'widgets/components/appbar.dart';

///This widget is a Form for creating a new card for the master user
///Upon validation it should call insertUser() with "isMainUser" set to 1.

class NewCardPage extends StatefulWidget {
  const NewCardPage({super.key});

  @override
  State<NewCardPage> createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController organizationController = TextEditingController();
  late TextEditingController titleController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController landPhoneController = TextEditingController();
  late TextEditingController mobilePhoneController = TextEditingController();
  late TextEditingController faxController = TextEditingController();
  late TextEditingController streetController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController regionController = TextEditingController();
  late TextEditingController postcodeController = TextEditingController();
  late TextEditingController countryController = TextEditingController();
  late TextEditingController urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Builder(builder: (context) {
          return const Appbar(title: 'New card', showBackButton: true);
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
                                            child: Form(
                                              key: _formKey,
                                              child: SingleChildScrollView(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                child: Column(
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            const CancelButton(),
                                            const PreviewButton(),
                                            ConfirmButton(
                                              formKey: _formKey,
                                              userData: UserData(
                                                isMainUser: 1,
                                                firstName: firstNameController.text,
                                                lastName: lastNameController.text,
                                                organization: organizationController.text,
                                                title: titleController.text,
                                                email: emailController.text,
                                                landPhone: landPhoneController.text,
                                                mobilePhone: mobilePhoneController.text,
                                                fax: faxController.text,
                                                street: streetController.text,
                                                city: cityController.text,
                                                region: regionController.text,
                                                postcode: postcodeController.text,
                                                country: countryController.text,
                                                url: urlController.text,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fill this field';
          }
          return null;
        },
      ),
    );
  }
}
