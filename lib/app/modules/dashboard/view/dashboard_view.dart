import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes/app_pages_with_dashboard.dart';
import '../../../routes/app_routes.dart';
import '../../common/widgets/appbar/bottom_app_bar/bloc/navigation_bloc.dart';
import '../../common/widgets/appbar/bottom_app_bar/bloc/navigation_state.dart';
import '../../common/widgets/appbar/bottom_app_bar/view/bottom_app_bar.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(NavigationState()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: const CustomBottomAppBar(),
        body: Navigator(
          onGenerateRoute: (settings) => AppPagesWithDashboard.onGenerateRoutes(settings),
          key: AppRoutes.dashboardNavigatorKey,
          initialRoute: AppRoutes.home,
        ),
      ),
    );
  }
}
