import 'package:flutter/material.dart';

class Homework extends StatelessWidget {
  const Homework({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Homework")),
      body: const Center(child: Text("Homework Content")),
    );
  }
}
