import 'package:flutter/material.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_pages.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_routes.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
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
    );
  }
}
