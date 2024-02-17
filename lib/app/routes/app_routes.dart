import 'package:flutter/cupertino.dart';

mixin AppRoutes {
  static GlobalKey<NavigatorState> dashboardNavigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String splash = "/splash";
  static const String location = "/location";
  static const String settings = "/settings";
  static const String episodes = "/episodes";
  static const String home = "/home";
  static const String dashboard = "/dashboard";
}
