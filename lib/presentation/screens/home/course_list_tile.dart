import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/presentation/bloc/course/course_bloc.dart';
import 'package:my_flutter_app/presentation/bloc/course/course_event.dart';
import 'package:my_flutter_app/presentation/bloc/course/course_state.dart';
import 'package:my_flutter_app/presentation/widgets/nav_bar.dart';
import 'package:go_router/go_router.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  bool _hasDispatchedLoad = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasDispatchedLoad) {
      context.read<CourseBloc>().add(LoadCourses());
      _hasDispatchedLoad = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses', style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: const NavBar(),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseInitial) {
            return const Center(child: Text('Loading courses...'));
          } else if (state is CourseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CourseLoaded) {
            final courses = state.courses;
            if (courses.isEmpty) {
              return const Center(child: Text('No courses available.'));
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: courses.length,
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
                        child: SizedBox(
                          height: 160,
                          width: double.infinity,
                          child: Image.network(
                            courses[index]['imageUrl'] ?? 'https://via.placeholder.com/300',
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.grey[200],
                                child: const Center(
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Icon(Icons.broken_image, size: 48, color: Colors.grey),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          courses[index]['title'] ?? 'No title',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          courses[index]['description'] ?? 'No description',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          context.read<CourseBloc>().add(SelectedCourse(courseId: courses[index]['id']));
                          context.push('/course/${courses[index]['id']}');
                        },
                        child: const Text('View Details'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is CourseError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.error}'),
                  ElevatedButton(
                    onPressed: () => context.read<CourseBloc>().add(LoadCourses()),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
