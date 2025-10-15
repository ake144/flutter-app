import 'package:flutter/material.dart';





class CourseListPage extends StatelessWidget{
      const CourseListPage({super.key});  


      @override

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _courseList.length,
      itemBuilder: (context, index) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                _courseList[index]['image']!,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _courseList[index]['title']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                _courseList[index]['description']!,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
  } 



  final _courseList = [
  {
    'title': 'Flutter for Beginners',
    'description': 'Learn the basics of Flutter development.',
    'image': 'assets/images/flutter_beginners.png',
  },
  {
    'title': 'Advanced Dart Programming',
    'description': 'Deep dive into Dart programming language.',
    'image': 'assets/images/dart_advanced.png',
  },
  {
    'title': 'State Management in Flutter',
    'description': 'Explore various state management techniques.',
    'image': 'assets/images/state_management.png',
  },
];
