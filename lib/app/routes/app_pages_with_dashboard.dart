import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/episodes/view/episodes_view.dart';
import '../modules/home/view/home_view.dart';
import '../modules/locations/view/locations_view.dart';
import '../modules/settings/view/settings_view.dart';
import 'app_pages.dart';
import 'app_routes.dart';

//* Aslında GETX de kullandığım çok güzel bir dashboard yapım var 2. bir navigatör e gerek kalmıyor fakat maalesef bloc ve vanilla state buna izin vermiyor tüm yolları denedim o yapıyı eklemek için olmadı
//* Buna döndüm GETX yine farkını ortaya koydu :)
mixin AppPagesWithDashboard {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => const HomeView(),
        );
      case AppRoutes.location:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => const LocationView(),
        );
      case AppRoutes.settings:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => const SettingsView(),
        );
      case AppRoutes.episodes:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => const EpisodesView(),
        );
      default:
        return null;
    }
  }
}
