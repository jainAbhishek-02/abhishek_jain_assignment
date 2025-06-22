import 'package:flutter/material.dart';

import 'safe_box.dart';

class CShapeBuilder extends StatelessWidget {
  final int boxCount;
  final List<bool> boxStates;
  final Function(int index) onBoxTap;
  final double boxSize;

  const CShapeBuilder({
    super.key,
    required this.boxCount,
    required this.boxStates,
    required this.onBoxTap,
    required this.boxSize,
  });

  @override
  Widget build(BuildContext context) {
    if (boxCount == 0) return const SizedBox.shrink();

    int rowCount = boxCount ~/ 3;
    int remainder = boxCount % 3;

    int topCount = rowCount + (remainder > 0 ? 1 : 0);
    int middleCount = rowCount;
    int bottomCount = rowCount + (remainder > 1 ? 1 : 0);

    int currentIndex = 0;

    List<Widget> topRow = List.generate(
      topCount,
      (_) => SafeBox(
        index: currentIndex++,
        boxStates: boxStates,
        size: boxSize,
        onTap: onBoxTap,
      ),
    );

    List<Widget> middleColumn = List.generate(
      middleCount,
      (_) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: SafeBox(
          index: currentIndex++,
          boxStates: boxStates,
          size: boxSize,
          onTap: onBoxTap,
        ),
      ),
    );

    List<Widget> bottomRow = List.generate(
      bottomCount,
      (_) => SafeBox(
        index: currentIndex++,
        boxStates: boxStates,
        size: boxSize,
        onTap: onBoxTap,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: topRow),
          const SizedBox(height: 4),
          ...middleColumn.map((box) => Row(children: [box])),
          const SizedBox(height: 4),
          Row(children: bottomRow),
        ],
      ),
    );
  }
}
