import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/appbar/bottom_app_bar/bloc/navigation_bloc.dart';
import '../../common/widgets/appbar/bottom_app_bar/bloc/navigation_state.dart';
import '../../common/widgets/appbar/bottom_app_bar/view/bottom_app_bar.dart';
import '../../common/widgets/appbar/custom_app_bar.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/texts/custom_text.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/app_pages_with_dashboard.dart';
import '../../../routes/app_routes.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/utils.dart';

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
