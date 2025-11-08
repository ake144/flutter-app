import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/presentation/screens/auth/login_screen.dart';
import 'package:my_flutter_app/presentation/screens/auth/otp.dart';
import 'package:my_flutter_app/presentation/screens/auth/signup_screen.dart';
import 'package:my_flutter_app/presentation/screens/course/course_detail_screen.dart';
import 'package:my_flutter_app/presentation/screens/home/course_list_tile.dart';
import 'package:my_flutter_app/presentation/screens/home/home_screen.dart';
import 'package:my_flutter_app/presentation/screens/profile/profile_screen.dart';
import 'package:my_flutter_app/presentation/widgets/chat/pages/chat_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home-screen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login-screen',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/courses',
      name: 'course-list',
      builder: (context, state) => const CourseListPage(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup-screen',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/otp',
      name: 'otp-screen',
      builder: (context, state) => const OtpScreen(),
    ),
    GoRoute(
      path: '/chat',
      name: 'chat-screen',
      builder: (context, state) => const ChatPage(courseId: 1, userId: 1),
    ),
    GoRoute(
      path: '/course/:id',
      name: 'course-detail',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CourseDetailScreen(courseId: id);
      },
    ),
    GoRoute(path: "/profile", 
        name: "profile-screen",
        builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
