import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/variables/colors.dart';
import '../../../models/character_model.dart';
import '../../common/widgets/texts/custom_text.dart';

class CharachterCard extends StatelessWidget {
  final Function()? onTap;
  final Character character;
  const CharachterCard({super.key, required this.character, this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: ColorTable.getTextColor(context).withOpacity(0.5), width: Utils.extraLowPadding(context)),
        image: DecorationImage(image: NetworkImage(character.image ?? AppConstants.unknownImagePath)),
        color: ColorTable.getTextColor(context),
        borderRadius: BorderRadius.circular(Utils.normalRadius(context)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(Utils.extraLowRadius(context)),
            ),
            child: Padding(
              padding: EdgeInsets.all(Utils.extraLowPadding(context)),
              child: CustomText(
                character.name,
                context,
                centerText: true,
                bold: true,
                maxlines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Utils.extraLowPadding(context).verticalSpace,
        ],
      ),
    );
  }
}
