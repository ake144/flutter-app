import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning App Home'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to the Learning App',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Discover courses designed to help you grow your skills and reach new heights.',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 24),

                    // Properly wrapped GridView
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.8,
                          ),
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return InkWell(
                          onTap: () => context.push('/course/${course['id']}'),
                          borderRadius: BorderRadius.circular(12),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.blue.shade50,
                                    child: const Icon(
                                      Icons.menu_book,
                                      size: 48,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      
                                      children: [
                                        Text(
                                          course['title']!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        // Text(
                                        //   course['description']!,
                                        //   style: TextStyle(
                                        //     fontSize: 14,
                                        //     color: Colors.grey[700],
                                        //   ),
                                        //   maxLines: 3,
                                        //   overflow: TextOverflow.ellipsis,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
  }
}

// Dummy course list
final courses = [
  {
    'id': '1',
    'title': 'Flutter for Beginners',
    'description':
        'Learn how to build your first mobile app using Flutter and Dart.',
    'image': 'assets/flutter_course.png',
  },
  {
    'id': '2',
    'title': 'Advanced Dart Programming',
    'description':
        'Master advanced Dart concepts to write efficient and clean code.',
    'image': 'assets/dart_course.png',
  },
  {
    'id': '3',
    'title': 'UI/UX Design Principles',
    'description':
        'Understand what makes great user interfaces and user experiences.',
    'image': 'assets/uiux_course.png',
  },
  {
    'id': '4',
    'title': 'State Management in Flutter',
    'description':
        'Get hands-on with Provider, Riverpod, and Bloc for app state management.',
    'image': 'assets/state_management.png',
  },
];
