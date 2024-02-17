import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/variables/colors.dart';
import '../../../../../../../core/variables/enums.dart';
import '../bloc/navigation_bloc.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utils.extraHighPadding(context)),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(Utils.highRadius(context)),
            border: Border.all(color: ColorTable.getTextColor(context).withOpacity(0.5), width: Utils.extraLowPadding(context) * .7),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _bottomBarIconButton(
                context,
                barRoutes: BottomBarRoutes.charachter,
                onPressed: () => context.read<NavigationBloc>().characterRouteTap(),
              ),
              _bottomBarIconButton(
                context,
                barRoutes: BottomBarRoutes.episodes,
                onPressed: () => context.read<NavigationBloc>().episodesRouteTap(),
              ),
              _bottomBarIconButton(
                context,
                barRoutes: BottomBarRoutes.location,
                onPressed: () => context.read<NavigationBloc>().locationRouteTap(),
              ),
              _bottomBarIconButton(
                context,
                barRoutes: BottomBarRoutes.settings,
                onPressed: () => context.read<NavigationBloc>().settignsRouteTap(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _bottomBarIconButton(BuildContext context, {required BottomBarRoutes barRoutes, required Function() onPressed}) {
    return SizedBox(
      height: Utils.bottomBarHeight(context),
      width: MediaQuery.of(context).size.width * 0.2,
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
          if (context.read<NavigationBloc>().state.selectedTab == barRoutes) return;
          Utils.offAndToNamedDashboard(barRoutes.route);
        },
      ),
    );
  }
}
