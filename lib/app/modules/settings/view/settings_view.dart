import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/utils.dart';
import '../../common/widgets/appbar/custom_app_bar.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/texts/custom_text.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: _buildAppBar(context),
      body: Center(child: CustomText("Settings", context)),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) => CustomAppBar(
        title: CustomText.withBorder(
          "Ayarlar",
          context,
          centerText: true,
          fontFamily: AppConstants.rickAndMortFont,
          textSize: Utils.extraHighTextSize(context) * 1.5,
          bold: true,
        ),
      );
}
