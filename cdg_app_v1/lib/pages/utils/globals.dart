import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey getWidgetImageKey = GlobalKey();
late SharedPreferences prefs;
final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
