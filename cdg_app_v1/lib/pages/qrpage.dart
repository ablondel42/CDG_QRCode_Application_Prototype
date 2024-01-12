// ignore_for_file: avoid_print
import 'package:cdg_app_v1/pages/home.dart';
import 'package:cdg_app_v1/pages/utils/globals.dart';
import 'package:cdg_app_v1/pages/widgets/qrpage/add_button.dart';
import 'package:cdg_app_v1/pages/widgets/qrpage/save_button.dart';
import 'package:cdg_app_v1/pages/widgets/qrpage/share_button.dart';
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'widgets/components/appbar.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key, required this.userData});

  final UserData userData;

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Builder(builder: (context) {
          return const Appbar(title: 'View', showBackButton: true);
        }),
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            child: RepaintBoundary(
              key: getWidgetImageKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.2),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(4.2),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                        flex: 2,
                                        child: Container(
                                          width: double.infinity,
                                          height: 220,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.background,
                                            borderRadius: BorderRadius.circular(4.2),
                                          ),
                                          child: Container(
                                            width: 200,
                                            height: 220,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).colorScheme.secondaryContainer,
                                              borderRadius: BorderRadius.circular(4.2),
                                            ),
                                            child: BuildCardListItem(userData: widget.userData),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.primary,
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment: const AlignmentDirectional(0.00, 0.00),
                                          child: Material(
                                            color: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4.2),
                                            ),
                                            child: Container(
                                              width: 170,
                                              height: 170,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context).colorScheme.background,
                                                borderRadius: BorderRadius.circular(4.2),
                                                border: Border.all(
                                                  color: Theme.of(context).colorScheme.tertiaryContainer,
                                                  width: 3,
                                                ),
                                              ),
                                              child: QrImageView(
                                                data: widget.userData.toString(),
                                                size: 240,
                                                // embeddedImageStyle: const QrEmbeddedImageStyle(
                                                //   size: Size(50, 50),
                                                // ),
                                                // embeddedImage: const AssetImage('assets/images/circleLogo.png'),
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
                            Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    alignment: const AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          const ShareButton(),
                                          const SaveButton(),
                                          AddButton(userData: widget.userData),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
