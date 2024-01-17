import 'package:cdg_app_v2/themes/custom_styles.g.dart';
import 'package:cdg_app_v2/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff122e0c),
        useMaterial3: true,
      ),
      home: const HomeView(),
    ),
  );
}
