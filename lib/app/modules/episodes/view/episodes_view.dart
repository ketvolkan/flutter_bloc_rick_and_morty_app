import 'package:flutter/material.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/view/bottom_app_bar.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/custom_app_bar.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/texts/custom_text.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/constants/app_constants.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/utils/utils.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: _buildAppBar(context),
      body: Center(child: CustomText("Episodes", context)),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) => CustomAppBar(
        title: CustomText.custom(
          "Bölümler",
          context,
          centerText: true,
          fontFamily: AppConstants.rickAndMortFont,
          textSize: Utils.extraHighTextSize(context) * 1.5,
          bold: true,
        ),
      );
}
