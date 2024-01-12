// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:cdg_app_v1/pages/qrpage.dart';
import 'package:cdg_app_v1/pages/widgets/edit/preview_button.dart';
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
  });

  void navigateToQrPage(BuildContext context, UserData userData) {
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QrPage(userData: userData),
        ),
      );
    }
  }

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
            ),
            shape: MaterialStateProperty.all(
              CircleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
              ),
            ),
          ),
          icon: Icon(
            Icons.qr_code_scanner_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
          onPressed: () async { /// TODO: Implement the parser here and redirect the data
            String scanResult = '-1';
            try {
              scanResult = await FlutterBarcodeScanner.scanBarcode(
                '#ffffffff',
                'CANCEL',
                true,
                ScanMode.QR,
              );
              if (isVCard(scanResult)) {
                // UserData userData = createUserDataFromVCard(scanResult);
                // if (context.mounted) navigateToQrPage(context, userData);
              } else if (isCdgCard(scanResult)) {
                // UserData userData = createUserDataFromCdgCard(scanResult);
                // if (context.mounted) navigateToQrPage(context, userData);
              } else {
                // delegateToOs(scanResult);
              }
              if (context.mounted && scanResult != '-1') {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(scanResult),
                            ElevatedButton(
                              child: const PreviewButton(),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            } catch (e) {
              print(e);
            }
          },
        ),
        Text(
          'Scan',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }

  bool isVCard(String scanResult) {
    return scanResult.startsWith("BEGIN:VCARD");
  }

  bool isCdgCard(String scanResult) {
    return scanResult.contains("empNo");
  }

  UserData createUserDataFromCdgCard(String scanResult) {
    print('createUserDataFromCdgCard: $scanResult');
    try {
      final userData = UserData.fromJson(jsonDecode(scanResult));
      return userData;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  void delegateToOs(String scanResult) async {
    print(scanResult);
    if (scanResult.startsWith('+') || (scanResult.length == 10 && isNumeric(scanResult))) {
      scanResult = 'tel: $scanResult';
    }
    final url = Uri.parse(scanResult);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Error: Could not launch $scanResult');
    }
  }
}
