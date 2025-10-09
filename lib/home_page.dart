import 'package:flutter/material.dart';
import 'package:my_flutter_app/tabs_demo.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: TabsDemo(),
    );
  }
}