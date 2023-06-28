import 'package:go_router/go_router.dart';

import '../vues/finder_body.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => FinderBody(
        bachelors: [],
      ),
    ),
  ],
);
