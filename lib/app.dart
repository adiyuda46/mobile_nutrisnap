import 'package:flutter/material.dart';
import 'package:nutrisnap_mobile/page/blocProvider/blocProvider.dart';
import 'package:nutrisnap_mobile/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalStateProvider(child: MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
    ),);
  }
}