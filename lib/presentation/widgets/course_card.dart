import 'package:flutter/material.dart';
import 'package:my_flutter_app/data/models/course_model.dart';

class CourseCard extends StatelessWidget{
    const CourseCard({super.key, required this.course, required this.onTap});
    final Course course;
    final VoidCallback onTap;

    @override
    Widget build(BuildContext context) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 2,
            child:  ListTile(
               title: Text(course.title),
               subtitle: Text(course.instructor),
               leading: Image.network(course.imageUrl),
               onTap: onTap,
               trailing: const Icon(Icons.arrow_forward_ios),
            )
        );
    }
}