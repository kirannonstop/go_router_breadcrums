import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Circular extends StatelessWidget {
  const Circular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Circular")),
      body: Column(
        children: [
          const Center(
              child: Text(
                  "Open Dialog on Route And Close It On Browser Back Button")),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.go('/dashboard/circular/dialog');
            },
            child: const Text("Open Dialog"),
          ),
        ],
      ),
    );
  }
}
