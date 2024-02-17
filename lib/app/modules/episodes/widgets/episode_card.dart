import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/variables/colors.dart';
import '../../../models/episode_model.dart';
import '../../common/widgets/texts/custom_text.dart';

class EpisodeCard extends StatelessWidget {
  final Function()? onTap;
  final Episode episode;
  const EpisodeCard({super.key, required this.episode, this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: ColorTable.getTextColor(context).withOpacity(0.5), width: Utils.extraLowPadding(context)),
        color: episode.color,
        borderRadius: BorderRadius.circular(Utils.normalRadius(context)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textCard(context, episode.name ?? ""),
          textCard(context, episode.airDate ?? ""),
          textCard(context, episode.episode ?? ""),
        ],
      ),
    );
  }

  SizedBox textCard(BuildContext context, String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: CustomText.low(
        text,
        context,
        centerText: true,
        bold: true,
      ),
    );
  }
}
