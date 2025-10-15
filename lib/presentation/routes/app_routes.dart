import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';


final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/login', builder: (context, state) => const DetailsPage()),