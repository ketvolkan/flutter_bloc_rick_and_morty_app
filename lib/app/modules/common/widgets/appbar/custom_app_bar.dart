import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class CustomAppBar extends StatelessWidget {
  ///App bar title
  final Widget? title;

  ///Geri butonunu gösterir veya gizler
  final bool showLeadingBackIcon;

  ///Title widgetını ortalar
  final bool centerTitle;

  final Widget? leadingIcon;

  ///App barın sağında listelenecek olan widgetlar
  final List<Widget>? actions;

  final Function()? onLeadingPressed;
  final double? leadingWidth;

  const CustomAppBar(
      {Key? key,
      this.title,
      this.showLeadingBackIcon = true,
      this.leadingIcon,
      this.actions,
      this.onLeadingPressed,
      this.centerTitle = false,
      this.leadingWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      toolbarHeight: Utils.appBarHeight(context),
      centerTitle: centerTitle,
      leadingWidth: showLeadingBackIcon ? leadingWidth ?? MediaQuery.of(context).size.width * 0.1 : 0,
      automaticallyImplyLeading: showLeadingBackIcon,
      leading: showLeadingBackIcon
          ? onLeadingPressed == null
              ? null
              : IconButton(
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onPressed: onLeadingPressed ?? () {},
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: Utils.highIconSize(context),
                    color: Theme.of(context).primaryColor,
                  ),
                )
          : null,
      title: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            if (leadingIcon != null) leadingIcon!,
            Expanded(
              child: Padding(
                padding: leadingIcon != null ? EdgeInsets.symmetric(horizontal: Utils.normalPadding(context)) : EdgeInsets.zero,
                child: title,
              ),
            ),
          ],
        ),
      ),
      actions: actions != null
          ? [
              Padding(
                padding: EdgeInsets.only(right: Utils.lowIconSize(context)),
                child: Wrap(runAlignment: WrapAlignment.center, direction: Axis.horizontal, children: actions!),
              )
            ]
          : null,
    );
  }
}
