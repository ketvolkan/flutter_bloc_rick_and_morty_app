import 'package:flutter/material.dart';

import '../../app/routes/app_routes.dart';

Future<R?> errorHandler<R>({required Future<R?> Function() tryMethod, required Function(dynamic exception) onErr}) async {
  try {
    return await tryMethod();
  } catch (exception) {
    debugPrint(exception.toString());
    return await onErr(exception);
  }
}

class Utils {
  static double extraLowTextSize(BuildContext context) => MediaQuery.of(context).size.height * 0.012;
  static double lowTextSize(BuildContext context) => MediaQuery.of(context).size.height * 0.015;
  static double normalTextSize(BuildContext context) => MediaQuery.of(context).size.height * 0.018;
  static double highTextSize(BuildContext context) => MediaQuery.of(context).size.height * 0.022;
  static double extraHighTextSize(BuildContext context) => MediaQuery.of(context).size.height * 0.025;

  static double extraLowPadding(BuildContext context) => MediaQuery.of(context).size.height * 0.005;
  static double lowPadding(BuildContext context) => MediaQuery.of(context).size.height * 0.01;
  static double normalPadding(BuildContext context) => MediaQuery.of(context).size.height * 0.015;
  static double highPadding(BuildContext context) => MediaQuery.of(context).size.height * 0.02;
  static double extraHighPadding(BuildContext context) => MediaQuery.of(context).size.height * 0.025;

  //Radius
  static double extraLowRadius(BuildContext context) => MediaQuery.of(context).size.height * 0.01;
  static double lowRadius(BuildContext context) => MediaQuery.of(context).size.height * 0.015;
  static double normalRadius(BuildContext context) => MediaQuery.of(context).size.height * 0.02;
  static double highRadius(BuildContext context) => MediaQuery.of(context).size.height * 0.025;
  static double extraHighRadius(BuildContext context) => MediaQuery.of(context).size.height * 0.035;

  //Icons
  static double extraLowIconSize(BuildContext context) => MediaQuery.of(context).size.height * 0.015;
  static double lowIconSize(BuildContext context) => MediaQuery.of(context).size.height * 0.02;
  static double normalIconSize(BuildContext context) => MediaQuery.of(context).size.height * 0.025;
  static double highIconSize(BuildContext context) => MediaQuery.of(context).size.height * 0.033;
  static double extraHighIconSize(BuildContext context) => MediaQuery.of(context).size.height * 0.04;

  static double appBarHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.07;
  static double bottomBarHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.0675;

  static Future<T?> toNamed<T>(BuildContext context, String route) async {
    return Navigator.of(context).pushNamed(route);
  }

  static Future<T?> offAndToNamed<T>(BuildContext context, String route) async {
    return Navigator.of(context).pushReplacementNamed(route);
  }

  static Future<T?> toNamedDashboard<T>(BuildContext context, String route) async {
    return AppRoutes.dashboardNavigatorKey.currentState?.pushNamed(route);
  }

  static Future<T?> offAndToNamedDashboard<T>(BuildContext context, String route) async {
    return AppRoutes.dashboardNavigatorKey.currentState?.pushReplacementNamed(route);
  }
}

extension CustomDoubleExtensions on double {
  SizedBox get horizontalSpace => SizedBox(width: this);
  SizedBox get verticalSpace => SizedBox(height: this);
}
