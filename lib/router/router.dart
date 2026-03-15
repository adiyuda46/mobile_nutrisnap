import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrisnap_mobile/page/srceens/home/home_screen.dart';
import 'package:nutrisnap_mobile/page/srceens/predict/image_picker.dart';
import 'package:nutrisnap_mobile/page/srceens/splash/splash.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Splash();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          path: '/preview',
          builder: (context, state) {
            final File? imageFile = state.extra as File?;
            return ImagePickerPage(imageFile: imageFile);
          },
        ),
      ],
    ),
  ],
);



    // // ga ke pake 
    // GoRoute(
    //   path: '/home',
    //   name: 'home',
    //   //builder:  (context, state) => HomeScreen(),
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const HomeScreen();
    //   },
    // ),
    // GoRoute(
    //   path: '/help',
    //   name: 'help',
    //   builder: (context, state) => HelpScreen(),
    // ),
    // GoRoute(
    //   path: '/info',
    //   name: 'info',
    //   builder: (context, state) => InfoScreen(),
    // ),
    // GoRoute(
    //   path: '/asset',
    //   name: 'asset',
    //   builder: (context, state) => AssetScreen(),
    // ),
    // GoRoute(
    //   name: 'predict',
    //   path: '/predict',
    //   builder: (BuildContext context, GoRouterState state) {
    //     final File? imageFile = state.extra as File?;
    //     return ImagePickerPage(imageFile: imageFile);
    //   },
    // ),
    // GoRoute(
    //   name: 'gizi',
    //   path: '/gizi',
    //   builder: (context, state) {
    //     final File? imageFile = state.extra as File?;
    //     return GiziSrceen(imageFile: imageFile);
    //   },
    // ),
    // GoRoute(
    //     name: 'gizi_detail',
    //     path: '/gizi_detail',
    //     builder: (context, state) => GiziDetailScreen()),