import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../routes/app_routes.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/dialogs/custom_progress_dialog.dart';
import '../../common/widgets/texts/custom_text.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) => Utils.offAndToNamed(AppRoutes.dashboard));
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
