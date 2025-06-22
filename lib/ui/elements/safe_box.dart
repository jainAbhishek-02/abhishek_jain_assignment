import 'package:flutter/material.dart';

import 'color_box.dart';

class SafeBox extends StatelessWidget {
  final int index;
  final List<bool> boxStates;
  final double size;
  final Function(int) onTap;

  const SafeBox({
    super.key,
    required this.index,
    required this.boxStates,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (index >= boxStates.length) {
      return SizedBox(width: size, height: size);
    }

    return ColorBox(
      size: size,
      isGreen: boxStates[index],
      onTap: () => onTap(index),
    );
  }
}
