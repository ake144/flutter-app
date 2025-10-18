import 'package:flutter/material.dart';
import 'package:my_flutter_app/data/repositories/course_repository.dart';
import 'package:my_flutter_app/presentation/widgets/nav_bar.dart';
import 'package:go_router/go_router.dart';





class CourseListPage extends StatefulWidget {
      const CourseListPage({super.key});  


      @override
      State<CourseListPage> createState()=> _CourseListPageState();

}


class _CourseListPageState extends State<CourseListPage>{

   late Future<List<dynamic>> courseFuture;

  @override
  void initState() {
    super.initState();
    courseFuture = CourseRepository.fetchAllCourses();
  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
          appBar: AppBar(
          title: const Text('Courses', style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
          backgroundColor: Colors.blueAccent, 
       ),
       drawer: const NavBar(),
        body: FutureBuilder(future: courseFuture,

        
         builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError){
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty){
              return Center(child: Text('No courses available.'));
            } else {
              final courses = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child:ListView.builder(
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
                              courses[index]['imageUrl']!,
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
                            courses[index]['title']!,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            courses[index]['description']!,
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                        ),
                        SizedBox(height: 8),
                        

                        Tab(
                          child: TextButton(
                              onPressed: () {
                                context.push('/course/${courses[index]['id']}');
                              },
                              child: Text('View Details')
                          ),
                        )
                      ]
                    )
                  )
                )
              );
            }
          }
        )
      );
  }
}       



  final _courseList = [
  {
    'id': "1",
    'title': 'Flutter for Beginners',
    'description': 'Learn the basics of Flutter development.',
    'image': 'https://images.unsplash.com/photo-1587620962725-abab7fe55159?auto=format&fit=crop&w=1200&q=80',
  },
  {
    'id': "2",
    'title': 'Advanced Dart Programming',
    'description': 'Deep dive into Dart programming language.',
    'image': 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?auto=format&fit=crop&w=1200&q=80',
  },
  {
    'id': "3",
    'title': 'State Management in Flutter',
    'description': 'Explore various state management techniques.',
    'image': 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=1200&q=80',
  },
];
