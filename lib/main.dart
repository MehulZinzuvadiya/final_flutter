import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/home_screen.dart';
import 'View/verse_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/verse',
          page: () => VerseScreen(),
        ),
      ],
    ),
  );
}
