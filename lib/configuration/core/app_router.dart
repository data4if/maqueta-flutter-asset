import 'package:conoce_gama/presentation/home/app_home.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AppHome(),
    ),
  ],
);
