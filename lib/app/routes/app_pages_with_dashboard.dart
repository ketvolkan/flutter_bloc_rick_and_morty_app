import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/episodes/bloc/episodes_state_bloc/episodes_data_bloc.dart';
import '../modules/episodes/bloc/episodes_state_bloc/episodes_data_state.dart';
import '../modules/episodes/view/episodes_view.dart';
import '../modules/home/bloc/home_state_bloc/home_data_bloc.dart';
import '../modules/home/bloc/home_state_bloc/home_data_state.dart';
import '../modules/home/view/home_view.dart';
import '../modules/locations/bloc/locations_state_bloc/locations_data_bloc.dart';
import '../modules/locations/bloc/locations_state_bloc/locations_data_state.dart';
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
          builder: (context) => BlocProvider(create: (context) => HomeDataBloc(HomeDataState()), child: const HomeView()),
        );
      case AppRoutes.location:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => BlocProvider(create: (context) => LocationsDataBloc(LocationsDataState()), child: const LocationsView()),
        );
      case AppRoutes.settings:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => const SettingsView(),
        );
      case AppRoutes.episodes:
        return CustomPageRoute(
          routeSettings: RouteSettings(name: settings.name),
          builder: (context) => BlocProvider(create: (context) => EpisodesDataBloc(EpisodesDataState()), child: const EpisodesView()),
        );
      default:
        return null;
    }
  }
}
