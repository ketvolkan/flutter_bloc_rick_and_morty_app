import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/variables/colors.dart';

class CustomProgressDialog extends StatelessWidget {
  final double? dimension;
  const CustomProgressDialog({super.key, this.dimension});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: const AssetImage(AppConstants.loaderPath),
          height: (dimension ?? MediaQuery.of(context).size.width * 0.3) + Utils.highPadding(context),
          width: (dimension ?? MediaQuery.of(context).size.width * 0.3) + Utils.highPadding(context),
          color: ColorTable.getTextColor(context),
        ),
        Image(
          image: const AssetImage(AppConstants.loaderPath),
          height: dimension ?? MediaQuery.of(context).size.width * 0.3,
          width: dimension ?? MediaQuery.of(context).size.width * 0.3,
        ),
      ],
    );
  }
}
