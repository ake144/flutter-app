import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning App Home'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'Welcome to the Learning App',
                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                   ),
                   SizedBox(height: 16),
                   Text(
                     'Explore a variety of courses to enhance your skills.',
                     style: TextStyle(fontSize: 16),
                   ),
                    SizedBox(height: 24),
                    GridPaper(
                        color: Colors.blue,
                        interval: 200,
                        divisions: 2,
                        subdivisions: 1,
                        child: Container(height: 500, width: double.infinity,
                          color: Colors.amber,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: Courses.length,
                          itemBuilder: (context, index) =>
                              Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                      child: Image.asset(
                                        Courses[index]['image']!,
                                        height: 100,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        Courses[index]['title']!,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        Courses[index]['description']!,
                                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        )
                        ),

                    )
                 ],
               ),
             )
    );
  }
}


final Courses = [
  {
    'title': 'Flutter for Beginners',
    'description': 'Learn the basics of Flutter development.',
    'image': 'assets/flutter_course.png',
  },
  {
    'title': 'Advanced Dart Programming',
    'description': 'Deep dive into Dart programming language.',
    'image': 'assets/dart_course.png',
  },
  {
    'title': 'UI/UX Design Principles',
    'description': 'Understand the fundamentals of UI/UX design.',
    'image': 'assets/uiux_course.png',
  },
];