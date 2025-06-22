import 'package:flutter/material.dart';

import 'ui/screens/c_shape_screen.dart';

void main() => runApp(const CBoxApp());

class CBoxApp extends StatelessWidget {
  const CBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CShapeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
