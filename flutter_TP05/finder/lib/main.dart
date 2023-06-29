import 'package:finder/vues/finder.dart';
import 'package:finder/vues/finder_body.dart';
import 'package:finder/vues/finder_liked_list_body.dart';
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
        builder: (context, state) => const FinderBody(),
        routes: [
          GoRoute(
            path: 'liked',
            builder: (context, state) => const FinderLikedListBody(),
          ),
          GoRoute(
            path: 'details',
            builder: (context, state) => const FinderLikedListBody(),
          ),
        ],
      ),
    ],
  );
}
