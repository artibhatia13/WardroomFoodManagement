import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.7,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[500],
      ),
    );
  }
}
