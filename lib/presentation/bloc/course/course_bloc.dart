import 'package:bloc/bloc.dart';
import 'course_event.dart';
import 'course_state.dart';
import 'package:my_flutter_app/data/repositories/course_repository.dart';
import 'package:my_flutter_app/presentation/bloc/auth_bloc/auth_bloc.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final AuthBloc authBloc;

  CourseBloc(this.authBloc) : super(CourseInitial()) {
    on<LoadCourses>(_onLoadCourses);
    on<SelectedCourse>(_onSelectedCourse);
  }

  Future<void> _onLoadCourses(LoadCourses event, Emitter<CourseState> emit) async {
    final token = authBloc.state.token;
    if (token == null) {
      emit(CourseError('No access token available. Please log in.'));
      return;
    }

    emit(CourseLoading());
    try {
      final courses = await CourseRepository.fetchAllCourses(token);
      emit(CourseLoaded(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }

  Future<void> _onSelectedCourse(SelectedCourse event, Emitter<CourseState> emit) async {
    final token = authBloc.state.token;
    if (token == null) {
      emit(CourseError('No access token available. Please log in.'));
      return;
    }

    emit(CourseLoading());
    try {
      final courseDetails = await CourseRepository.fetchCourseDetails(event.courseId, token);
      emit(CourseSelected(courseDetails));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }
}