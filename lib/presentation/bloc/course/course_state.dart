import 'package:equatable/equatable.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object?> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<dynamic> courses;

  const CourseLoaded(this.courses);

  @override
  List<Object?> get props => [courses];
}

class CourseError extends CourseState {
  final String error;

  const CourseError(this.error);

  @override
  List<Object?> get props => [error];
}

class CourseSelected extends CourseState {
  final Map<String, dynamic> courseDetails;

  const CourseSelected(this.courseDetails);

  @override
  List<Object?> get props => [courseDetails];
}