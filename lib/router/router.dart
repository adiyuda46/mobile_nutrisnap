import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrisnap_mobile/page/srceens/asset/asser_screen.dart';
import 'package:nutrisnap_mobile/page/srceens/help/help_srceen.dart';
import 'package:nutrisnap_mobile/page/srceens/home/homeScreen.dart';
import 'package:nutrisnap_mobile/page/srceens/info/info_srceen.dart';
import 'package:nutrisnap_mobile/page/srceens/predict/image_picker.dart';
import 'package:nutrisnap_mobile/page/srceens/splash/splash.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => Splash(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/help',
      name: 'help',
      builder: (context, state) => HelpScreen(),
    ),
    GoRoute(
      path: '/info',
      name: 'info',
      builder: (context, state) => InfoScreen(),
    ),
    GoRoute(
      path: '/asset',
      name: 'asset', // 👈 Tambahkan name!
      builder: (context, state) =>
          AssetScreen(), // 💡 Apakah ini memang diinginkan?
    ),
    GoRoute(
  name: 'predict',
  path: '/predict',
  builder: (context, state) {
    print("adi 2.1");
    final File? imageFile = state.extra as File?;
    print("adi 2:$imageFile");
    return ImagePickerPage(imageFile: imageFile);
  },
),

  ],
);
