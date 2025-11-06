import 'package:bloc/bloc.dart';
import 'course_event.dart';
import 'course_state.dart';
import 'package:my_flutter_app/data/repositories/course_repository.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<LoadCourses>(_onLoadCourses);
    on<SelectedCourse>(_onSelectedCourse);
  }

  Future<void> _onLoadCourses(LoadCourses event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      final courses = await CourseRepository.fetchAllCourses();
      emit(CourseLoaded(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }

  Future<void> _onSelectedCourse(SelectedCourse event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      final courseDetails = await CourseRepository.fetchCourseDetails(event.courseId);
      emit(CourseSelected(courseDetails));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }
}