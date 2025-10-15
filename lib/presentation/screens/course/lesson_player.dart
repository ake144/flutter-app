import 'package:flutter/material.dart';


class  LessonPlayer extends StatelessWidget {
  const LessonPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson Player'),
      ),
      body: const Center(
        child: Text('Lesson Player Screen'),
      ),
    );
  }
}
