import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  final bool isGreen;
  final VoidCallback onTap;
  final double size;

  const ColorBox({
    super.key,
    required this.isGreen,
    required this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: size,
        height: size,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: isGreen ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
