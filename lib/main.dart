import 'package:flutter/material.dart';
import 'app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_bloc.dart';
import 'app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/themes/app_theme.dart';

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
