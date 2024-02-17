import 'package:flutter/material.dart';
import '../../app/routes/app_routes.dart';

enum BottomBarRoutes {
  charachter,
  location,
  episodes,
  settings;

  IconData get icon {
    switch (this) {
      case BottomBarRoutes.charachter:
        return Icons.people;
      case BottomBarRoutes.location:
        return Icons.location_city_rounded;
      case BottomBarRoutes.episodes:
        return Icons.movie;
      case BottomBarRoutes.settings:
        return Icons.settings;
    }
  }

  String get route {
    switch (this) {
      case BottomBarRoutes.charachter:
        return AppRoutes.home;
      case BottomBarRoutes.location:
        return AppRoutes.location;
      case BottomBarRoutes.episodes:
        return AppRoutes.episodes;
      case BottomBarRoutes.settings:
        return AppRoutes.settings;
    }
  }
}
