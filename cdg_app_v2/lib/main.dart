import 'package:cdg_app_v2/themes/color_scheme.g.dart';
import 'package:cdg_app_v2/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      home: const HomeView(),
    ),
  );
}
