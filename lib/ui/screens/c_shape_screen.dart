import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../elements/c_shape_builder.dart';

class CShapeScreen extends StatefulWidget {
  const CShapeScreen({super.key});

  @override
  State<CShapeScreen> createState() => _CShapeScreenState();
}

class _CShapeScreenState extends State<CShapeScreen> {
  final TextEditingController _controller = TextEditingController();
  int boxCount = 0;
  List<bool> boxStates = [];
  List<int> tapOrder = [];
  bool isAnimatingBack = false;

  void _generateBoxes() {
    final input = int.tryParse(_controller.text.trim());
    if (input != null && input >= 5 && input <= 25) {
      setState(() {
        boxCount = input;
        boxStates = List.generate(input, (_) => false);
        tapOrder = [];
        isAnimatingBack = false;
      });
      FocusManager.instance.primaryFocus?.unfocus();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a number between 5 and 25')),
      );
    }
  }

  void _handleBoxTap(int index) {
    if (isAnimatingBack || index >= boxStates.length) return;

    if (!boxStates[index]) {
      setState(() {
        boxStates[index] = true;
        tapOrder.add(index);
      });

      if (boxStates.every((e) => e)) {
        _startReverseAnimation();
      }
    }
  }

  void _startReverseAnimation() async {
    setState(() => isAnimatingBack = true);

    for (int i = tapOrder.length - 1; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      if (i < tapOrder.length && tapOrder[i] < boxStates.length) {
        setState(() {
          boxStates[tapOrder[i]] = false;
        });
      }
    }

    setState(() {
      tapOrder.clear();
      isAnimatingBack = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double boxSize = 40;

    return Scaffold(
      appBar: AppBar(title: const Text('C Shape Boxes')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter a number (5 - 25)',
                      border: OutlineInputBorder(),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _generateBoxes,
                  child: const Text('Generate'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: CShapeBuilder(
                  boxCount: boxCount,
                  boxStates: boxStates,
                  boxSize: boxSize,
                  onBoxTap: _handleBoxTap,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
