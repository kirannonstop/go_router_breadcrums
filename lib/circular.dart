import 'package:flutter/material.dart';

class Circular extends StatelessWidget {
  const Circular({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Circular")),
      body: const Center(child: Text("Circular Content")),
    );
  }
}
