import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails details;

  const CustomErrorWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          const Text(
            "Oops! Something went wrong.",
            style: TextStyle(
              fontSize: 18,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            details.exceptionAsString(),
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
