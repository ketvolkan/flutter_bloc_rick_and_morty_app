import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/view/bottom_app_bar.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/dashboard/view/dashboard_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/episodes/view/episodes_view.dart';

import 'package:flutter_bloc_rick_and_morty_app/app/modules/home/view/home_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/locations/view/locations_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/settings/view/settings_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/splash/view/splash_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_routes.dart';

mixin AppPages {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => const SplashView(),
        );
      case AppRoutes.dashboard:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => const DashboardView(),
        );

      default:
        return null;
    }
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget Function(BuildContext) builder;
  final RouteSettings? routeSettings;
  CustomPageRoute({required this.builder, this.routeSettings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 0.2);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          settings: routeSettings,
        );
}
