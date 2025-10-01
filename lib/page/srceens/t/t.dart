import 'package:flutter/material.dart';

class T extends StatefulWidget {
  const T({super.key});

  @override
  State<T> createState() => _TState();
}

class _TState extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("tttt"),),
      body: Center(
        child: Text("tttkkktt"),
      ),
    );
  }
}