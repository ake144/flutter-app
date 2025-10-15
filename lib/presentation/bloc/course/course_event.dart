import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CourseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCourses extends CourseEvent {}


class SelectedCourse extends CourseEvent {
  final String courseId;

  SelectedCourse({required this.courseId});

  @override
  List<Object?> get props => [courseId];
}
