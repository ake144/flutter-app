import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget   {
  CourseDetailScreen({super.key, required this.courseId});

  final String courseId;


  // Remove this line; move course lookup into build method

  @override
  Widget build(BuildContext context) {
    final Map<String, String> course = courseList.firstWhere((course) => course['id'] == courseId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Detail Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 25, 5, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Course Title: ${course['title'] ?? ''}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                course['imageUrl'] ?? '',
                width: 60,
                height: 60,
               fit: BoxFit.cover,
               errorBuilder: (context, error, stackTrace) {
                 return Container(
                   width: 80,
                   height: 90,
                   color: Colors.grey[300],
                   child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                 );
               },
              ),
            ),
            title: Text(
                course['title'] ?? '',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('by ${course['instructor'] ?? ''}'),
              trailing: Text(course['duration'] ?? ''),

            ),
            const SizedBox(height: 16),
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
      ),
    );
  }
}


final courseList = [
  {
    "id": '1',
    'title': 'Flutter for Beginners',
    'description': 'Learn the basics of Flutter development.',
    'instructor': 'John Doe',
    'duration': '4 weeks',
    'imageUrl': 'https://images.unsplash.com/photo-1628277613967-6abca504d0ac?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1170',
  },
  {
    "id": '2',
    'title': 'Advanced Dart Programming',
    'description': 'Deep dive into Dart programming language.',
    'instructor': 'Jane Smith',
    'duration': '6 weeks',
    'imageUrl': 'https://example.com/dart_course.jpg',
  },
  {
    "id": '3',
    'title': 'State Management in Flutter',
    'description': 'Explore various state management techniques in Flutter.',
    'instructor': 'Alice Johnson',
    'duration': '5 weeks',
    'imageUrl': 'https://example.com/state_management_course.jpg',
  },
];