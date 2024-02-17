import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_pages.dart';

import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_routes.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/bloc/navigator_bloc.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/utils/utils.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/variables/colors.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/variables/enums.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _bottomBarIconButton(context.watch<NavigatorBloc>().state.context ?? context,
              barRoutes: BottomBarRoutes.charachter, onPressed: () => context.read<NavigationBloc>().characterRouteTap()),
          _bottomBarIconButton(context.watch<NavigatorBloc>().state.context ?? context,
              barRoutes: BottomBarRoutes.episodes, onPressed: () => context.read<NavigationBloc>().episodesRouteTap()),
          _bottomBarIconButton(context.watch<NavigatorBloc>().state.context ?? context,
              barRoutes: BottomBarRoutes.location, onPressed: () => context.read<NavigationBloc>().locationRouteTap()),
          _bottomBarIconButton(context.watch<NavigatorBloc>().state.context ?? context,
              barRoutes: BottomBarRoutes.settings, onPressed: () => context.read<NavigationBloc>().settignsRouteTap()),
        ],
      ),
    );
  }

  SizedBox _bottomBarIconButton(BuildContext context, {required BottomBarRoutes barRoutes, required Function() onPressed}) {
    return SizedBox(
      height: Utils.bottomBarHeight(context),
      width: MediaQuery.of(context).size.width * 0.25,
      child: IconButton(
        iconSize: Utils.normalIconSize(context) * 1.25,
        icon: Column(
          children: [
            CircleAvatar(
              radius: Utils.normalIconSize(context),
              backgroundColor: context.watch<NavigationBloc>().state.selectedTab == barRoutes
                  ? ColorTable.getTextColor(context)
                  : Theme.of(context).scaffoldBackgroundColor,
              child: Icon(
                barRoutes.icon,
                color: context.watch<NavigationBloc>().state.selectedTab == barRoutes
                    ? Theme.of(context).scaffoldBackgroundColor
                    : ColorTable.getTextColor(context),
                size: Utils.highIconSize(context),
              ),
            ),
          ],
        ),
        onPressed: () {
          onPressed();
          Utils.offAndToNamed(context, barRoutes.route);
        },
      ),
    );
  }
}
