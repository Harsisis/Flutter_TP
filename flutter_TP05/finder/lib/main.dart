import 'package:finder/vues/bachelor_detail.dart';
import 'package:finder/vues/finder.dart';
import 'package:finder/vues/finder_screen.dart';
import 'package:finder/vues/finder_liked_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const Finder());
}

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const FinderScreen(),
        routes: [
          GoRoute(
            path: 'liked',
            builder: (context, state) => const FinderLikedListScreen(),
          ),
          GoRoute(
            path: 'details/:id',
            builder: (context, state) =>
                BachelorDetail(id: int.parse(state.pathParameters['id'] ?? "")),
          ),
        ],
      ),
    ],
  );
}
