import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget   {
  CourseDetailScreen({super.key, required this.courseId});

  final String courseId;

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
              Text(
                'Course Title: ${CourseList.firstWhere((course) => course['id'] == courseId)['title']}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              ...CourseList.map((course) {
                return ListTile(
                  leading: Image.network(
                    course['imageUrl'] ?? '',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        course['title'] ?? '',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('by ${course['instructor'] ?? ''}'),
                    );
                  }),
                   
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
      )
          
    );
  }
}


final CourseList = [
  {
    "id": '1',
    'title': 'Flutter for Beginners',
    'description': 'Learn the basics of Flutter development.',
    'instructor': 'John Doe',
    'duration': '4 weeks',
    'imageUrl': 'https://example.com/flutter_course.jpg',
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