import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Color.from(alpha: 0.7, red: 1, green: 1, blue: 1),
          fontSize: 20,
          fontFamily: "Inter",
        ),
      ),
    );
  }
}
