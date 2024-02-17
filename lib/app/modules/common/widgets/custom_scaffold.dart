import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_pages.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_routes.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/bloc/navigator_bloc.dart';

import '../../../../../core/utils/utils.dart';

///Her sayfa için ideal başlangıç scaffold'u.
///Bodyde standart bir padding ve singlechild scrollview döndürür.
class CustomScaffold extends StatelessWidget {
  final Widget? appBar;
  final Widget? body;
  final EdgeInsetsGeometry? bodyPadding;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final bool resizeToAvoidBottomInset;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  const CustomScaffold(
      {Key? key,
      this.appBar,
      this.body,
      this.bottomNavigationBar,
      this.backgroundColor,
      this.bodyPadding,
      this.floatingActionButtonLocation,
      this.extendBodyBehindAppBar = false,
      this.extendBody = false,
      this.resizeToAvoidBottomInset = true,
      this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        extendBody: extendBody,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButtonLocation: floatingActionButtonLocation,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: PreferredSize(preferredSize: Size.fromHeight(Utils.appBarHeight(context)), child: appBar ?? const SizedBox()),
        body: bodyWithPadding(context),
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  Padding bodyWithPadding(BuildContext context) => Padding(
        padding: bodyPadding ?? EdgeInsets.symmetric(horizontal: Utils.highPadding(context)),
        child: body,
      );
}
