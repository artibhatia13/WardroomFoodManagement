import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[350],
      ),
    );
  }
}
