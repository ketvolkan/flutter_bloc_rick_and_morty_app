import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../app/modules/common/widgets/dialogs/custom_progress_dialog.dart';
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
  static void back<T>() async {
    return AppRoutes.navigatorKey?.currentState?.pop();
  }

  static Future<T?> toNamed<T>(String route) async {
    return AppRoutes.navigatorKey?.currentState?.pushNamed(route);
  }

  static Future<T?> offAndToNamed<T>(String route) async {
    return AppRoutes.navigatorKey?.currentState?.pushReplacementNamed(route);
  }

  static void backDashboard<T>() async {
    return AppRoutes.dashboardNavigatorKey?.currentState?.pop();
  }

  static Future<T?> toNamedDashboard<T>(String route) async {
    return AppRoutes.dashboardNavigatorKey?.currentState?.pushNamed(route);
  }

  static Future<T?> offAndToNamedDashboard<T>(String route) async {
    return AppRoutes.dashboardNavigatorKey?.currentState?.pushReplacementNamed(route);
  }

  static Future<T?> showProgressDialog<T>() async {
    if (AppRoutes.navigatorKey?.currentState == null) return null;
    await showDialog<T?>(
      context: AppRoutes.navigatorKey!.currentState!.context,
      builder: (context) => const CustomProgressDialog(),
      barrierDismissible: false,
    );
    return null;
  }

  static Future<void> showErrorDialog(String subtitle, {String? title}) async {
    if (AppRoutes.navigatorKey?.currentState == null) return;
    await AwesomeDialog(
      context: AppRoutes.navigatorKey!.currentState!.context,
      title: title ?? "Hata",
      desc: subtitle,
      btnCancelText: "Kapat",
    ).show();
  }
}

extension CustomDoubleExtensions on double {
  SizedBox get horizontalSpace => SizedBox(width: this);
  SizedBox get verticalSpace => SizedBox(height: this);
}
