import 'package:flutter/material.dart';
import 'package:nutrisnap_mobile/app.dart';

class GiziSrceen extends StatefulWidget {
  const GiziSrceen({super.key});

  @override
  State<GiziSrceen> createState() => _GiziSrceenState();
}

class _GiziSrceenState extends State<GiziSrceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gizi"),
      ),
      body: Center(
        child: Text("tes"),
      ),
    );
  }
}
