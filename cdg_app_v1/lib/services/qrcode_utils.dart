// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'dart:ui' as ui;
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

/// This function will get the render object of the widget designated by the GlobalKey imageKey,
/// which is declared in pages/utils/globals.dart. The image will then be saved in the image gallery.
/// You need to make sure it works on iOS as well.
void captureAndDownloadWidgetImage(GlobalKey imageKey) async {
  try {
    RenderRepaintBoundary boundary = imageKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    if (boundary.debugNeedsPaint) {
      await Future.delayed(const Duration(milliseconds: 20));
      return captureAndDownloadWidgetImage(imageKey);
    }
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
    }
  } catch (error) {
    if (kDebugMode) {
      print(error);
    }
  }
}

/// Same as the above function but the feature is from the "share_plus" package. The widget
/// is saved to "downloads", shared, and then deleted. You need to make sure it works on iOS as well.
void captureAndShareWidgetImage(GlobalKey imageKey) async {
  try {
    RenderRepaintBoundary boundary = imageKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    if (boundary.debugNeedsPaint) {
      await Future.delayed(const Duration(milliseconds: 20));
      return captureAndShareWidgetImage(imageKey);
    }
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      File file = File('/storage/emulated/0/Download/share.png');
      await file.writeAsBytes(byteData!.buffer.asUint8List(0, byteData.lengthInBytes));
      await Share.shareFiles([
        '/storage/emulated/0/Download/share.png'
      ]);
      await file.delete();
    }
  } catch (error) {
    if (kDebugMode) {
      print(error);
    }
  }
}

/// This function creates a new Contact object, this object is defined in the plugin
/// "flutter_contacts". Lookup on pub.dev to see the data model and methods.
void addEmployeeToContacts(UserData userData) async {
  try {
    if (await Permission.contacts.request().isGranted) {
      final newContact = Contact()
        ..displayName = '${userData.firstName} ${userData.lastName}'
        ..name.first = userData.firstName
        ..name.last = userData.lastName
        ..phones = [
          Phone(userData.mobilePhone, label: PhoneLabel.mobile)
        ]
        ..emails = [
          Email(userData.email, label: EmailLabel.work)
        ]
        ..organizations = [
          Organization(company: userData.organization)
        ];
      await newContact.insert();
    }
  } catch (error) {
    if (kDebugMode) {
      print(error);
    }
  }
}
