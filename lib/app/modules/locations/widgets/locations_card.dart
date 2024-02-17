import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/variables/colors.dart';
import '../../../models/location_model.dart';
import '../../common/widgets/texts/custom_text.dart';

class LocationCard extends StatelessWidget {
  final Function()? onTap;
  final Location location;
  const LocationCard({super.key, required this.location, this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: ColorTable.getTextColor(context).withOpacity(0.5), width: Utils.extraLowPadding(context)),
        color: location.color,
        borderRadius: BorderRadius.circular(Utils.normalRadius(context)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textCard(context, location.name ?? ""),
          textCard(context, location.type ?? ""),
          textCard(context, location.dimension ?? ""),
        ],
      ),
    );
  }

  SizedBox textCard(BuildContext context, String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: CustomText(
        text,
        context,
        centerText: true,
        bold: true,
        maxlines: 2,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
