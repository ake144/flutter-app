import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:my_flutter_app/presentation/screens/auth/login_screen.dart';
import 'package:my_flutter_app/presentation/screens/auth/otp.dart';
import 'package:my_flutter_app/presentation/screens/auth/signup_screen.dart';
import 'package:my_flutter_app/presentation/screens/course/course_detail_screen.dart';
import 'package:my_flutter_app/presentation/screens/home/course_list_tile.dart';
import 'package:my_flutter_app/presentation/screens/home/home_screen.dart';
import 'package:my_flutter_app/presentation/screens/profile/profile_screen.dart';
import 'package:my_flutter_app/presentation/widgets/chat/pages/chat_page.dart';

// Small helper to convert a Stream into a Listenable for GoRouter's
// `refreshListenable`. This notifies GoRouter when the authBloc emits.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _sub = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

GoRouter createAppRouter(AuthBloc authBloc) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    routes: [
      GoRoute(
        path: '/',
        name: 'home-screen',
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login-screen',
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: '/courses',
        name: 'course-list',
        builder: (_, __) => const CourseListPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup-screen',
        builder: (_, __) => const SignupScreen(),
      ),
      GoRoute(
        path: '/otp',
        name: 'otp-screen',
        builder: (_, __) => const OtpScreen(),
      ),
      GoRoute(
        path: '/chat',
        name: 'chat-screen',
        builder: (_, __) => const ChatPage(courseId: 1, userId: 1),
      ),
      GoRoute(
        path: '/course/:id',
        name: 'course-detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return CourseDetailScreen(courseId: id);
        },
      ),
      GoRoute(
        path: "/profile",
        name: "profile-screen",
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
    redirect: (context, state) {
      final loggedIn = authBloc.state.isAuthenticated;
      final loggingIn = state.uri.path == '/login' || state.uri.path == '/signup' || state.uri.path == '/otp';

      if (!loggedIn && !loggingIn) return '/login';
      if (loggedIn && loggingIn) return '/';

      return null;
    },
  );
}
