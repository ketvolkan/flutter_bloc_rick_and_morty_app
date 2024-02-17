import 'package:flutter/material.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/custom_app_bar.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/texts/custom_text.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/routes/app_pages.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/constants/app_constants.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/utils/utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: _buildAppBar(context),
      body: Center(child: CustomText("Home", context)),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) => CustomAppBar(
        title: CustomText.custom(
          "Karakterler",
          context,
          centerText: true,
          fontFamily: AppConstants.rickAndMortFont,
          textSize: Utils.extraHighTextSize(context) * 1.5,
          bold: true,
        ),
      );
}
