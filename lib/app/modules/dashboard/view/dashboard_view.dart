import 'package:flutter/material.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/view/bottom_app_bar.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/custom_app_bar.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/texts/custom_text.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_pages.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_pages_with_dashboard.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_routes.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/constants/app_constants.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/utils/utils.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: const CustomBottomAppBar(),
      body: Navigator(
        onGenerateRoute: (settings) => AppPagesWithDashboard.onGenerateRoutes(settings),
        key: AppRoutes.dashboardNavigatorKey,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
