import 'package:flutter/material.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/dialogs/custom_progress_dialog.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/texts/custom_text.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_routes.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/constants/app_constants.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/utils/utils.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) => Utils.offAndToNamed(context, AppRoutes.dashboard));
    return CustomScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [imageSide(context), Utils.extraHighIconSize(context).verticalSpace, appNameSide(context)],
        ),
      ),
    );
  }

  CustomText appNameSide(BuildContext context) {
    return CustomText.custom(
      "Rick And Morty",
      context,
      bold: true,
      textSize: Utils.extraHighTextSize(context) * 2,
      fontFamily: AppConstants.rickAndMortFont,
    );
  }

  CustomProgressDialog imageSide(BuildContext context) => CustomProgressDialog(dimension: MediaQuery.of(context).size.width * 0.65);
}
