import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrisnap_mobile/utils/color.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 
  @override
  void initState() {
    super.initState();

    // Delay 3 detik, lalu redirect ke /home
    Future.delayed(const Duration(seconds: 3), () {
      print("=== 1");
      context.pushReplacement('/home');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NutrisnapColors.primary, // Warna #12372A
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "NUTRISNAP",
              style: TextStyle(
                color: NutrisnapColors.textPrimary,
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/icons.png',
              width: 180, 
              height: 180,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}