import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_state.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/view/bottom_app_bar.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/episodes/view/episodes_view.dart';

import 'package:flutter_bloc_rick_and_morty_app/app/modules/home/view/home_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/locations/view/locations_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/settings/view/settings_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/splash/view/splash_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_routes.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/bloc/navigator_bloc.dart';

mixin AppPages {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => const HomeView(),
        );
      case AppRoutes.episodes:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => const EpisodesView(),
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
      case AppRoutes.splash:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => const SplashView(),
        );
      default:
        return null;
    }
  }

  static Widget routeBuilder(BuildContext context, Widget child) {
    return Scaffold(
      body: child,
      bottomNavigationBar: context.watch<NavigatorBloc>().state.showDashboard ? const CustomBottomAppBar() : null,
    );
  }

  static List<String> get withoutDashboardPage => [AppRoutes.splash];
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
