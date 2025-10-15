import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget   {
  CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Detail Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
           padding: const EdgeInsets.all(16.0),

           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Course Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Instructor: John Doe',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Duration: 4 weeks',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              const Text(
                'Course Description:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'This course provides a comprehensive introduction to Flutter development. You will learn how to build beautiful and responsive mobile applications using Flutter and Dart programming language.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle enrollment action
                  },
                  child: const Text('Enroll Now'),
                ),
              ),
            ],
           ),
      )
          
    );
  }
}


final CourseList = [
  {
    'title': 'Flutter for Beginners',
    'description': 'Learn the basics of Flutter development.',
    'instructor': 'John Doe',
    'duration': '4 weeks',
    'imageUrl': 'https://example.com/flutter_course.jpg',
  },
  {
    'title': 'Advanced Dart Programming',
    'description': 'Deep dive into Dart programming language.',
    'instructor': 'Jane Smith',
    'duration': '6 weeks',
    'imageUrl': 'https://example.com/dart_course.jpg',
  },
  {
    'title': 'State Management in Flutter',
    'description': 'Explore various state management techniques in Flutter.',
    'instructor': 'Alice Johnson',
    'duration': '5 weeks',
    'imageUrl': 'https://example.com/state_management_course.jpg',
  },
];