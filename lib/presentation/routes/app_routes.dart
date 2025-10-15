import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/presentation/screens/auth/login_screen.dart';
import 'package:my_flutter_app/presentation/screens/auth/signup_screen.dart';
import 'package:my_flutter_app/presentation/screens/course/course_detail_screen.dart';
import 'package:my_flutter_app/presentation/screens/home/course_list_tile.dart';
import 'package:my_flutter_app/presentation/screens/home/home_screen.dart';



final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) =>  const LoginScreen()),
    GoRoute(path: '/courses', builder: (context, state) => const CourseListPage()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(
      path: '/course/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CourseDetailScreen(courseId: id);
      },
    ),
  ],
);