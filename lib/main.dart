import 'package:flutter/material.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_state.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/episodes/view/episodes_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/home/view/home_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/locations/view/locations_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/settings/view/settings_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/splash/view/splash_view.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/utils/utils.dart';
import 'app/routes/bloc/navigator_state.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_pages.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_routes.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/bloc/navigator_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/themes/app_theme.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NavigationBloc>(create: (context) => NavigationBloc(NavigationState())),
    BlocProvider<NavigatorBloc>(create: (context) => NavigatorBloc(bloc.NavigatorState())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext contextMaterial) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light(contextMaterial),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: (settings) => AppPages.onGenerateRoutes(settings),
      builder: (context, child) => AppPages.routeBuilder(contextMaterial, child ?? const SizedBox.shrink()),
      //* GoRouter kullanmama sebebim gorouter v2 den sonra builder a erişimi engellemişler dashboard yapım için gerekiyor
    );
  }
}
