import 'package:flutter/material.dart';

class DialogAsARoute extends StatelessWidget {
  const DialogAsARoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //sample information of this dialog
           const Text("Dialog as a Route",),
           const SizedBox(height: 20),
           //cancel button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
            },
              child: const Text("Close Dialog"),
            ),
        ],
      ),
    );
  }
}