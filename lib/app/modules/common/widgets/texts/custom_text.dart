import 'package:flutter/material.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/constants/app_constants.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/variables/colors.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String? text;
  double? textSize;
  final Color? textColor;
  final bool underlined;
  final bool lineThrough;
  final bool bold;
  final bool centerText;
  final String? fontFamily;
  final TextOverflow? textOverflow;
  final int? maxlines;
  final BuildContext context;
  CustomText(
    this.text,
    this.context, {
    Key? key,
    this.fontFamily,
    this.textColor,
    this.underlined = false,
    this.bold = false,
    this.centerText = false,
    this.textOverflow,
    this.maxlines,
    this.lineThrough = false,
  }) : super(key: key) {
    textSize = Utils.normalTextSize(context);
  }
  CustomText.extraLow(
    this.text,
    this.context, {
    Key? key,
    this.fontFamily,
    this.textColor,
    this.underlined = false,
    this.bold = false,
    this.centerText = false,
    this.textOverflow,
    this.maxlines,
    this.lineThrough = false,
  }) : super(key: key) {
    textSize = Utils.extraLowTextSize(context);
  }
  CustomText.low(
    this.text,
    this.context, {
    Key? key,
    this.fontFamily,
    this.textColor,
    this.underlined = false,
    this.bold = false,
    this.centerText = false,
    this.textOverflow,
    this.maxlines,
    this.lineThrough = false,
  }) : super(key: key) {
    textSize = Utils.lowTextSize(context);
  }
  CustomText.high(
    this.text,
    this.context, {
    Key? key,
    this.fontFamily,
    this.textColor,
    this.underlined = false,
    this.bold = false,
    this.centerText = false,
    this.textOverflow,
    this.maxlines,
    this.lineThrough = false,
  }) : super(key: key) {
    textSize = Utils.highTextSize(context);
  }
  CustomText.extraHigh(
    this.text,
    this.context, {
    Key? key,
    this.fontFamily,
    this.textColor,
    this.underlined = false,
    this.bold = false,
    this.centerText = false,
    this.textOverflow,
    this.maxlines,
    this.lineThrough = false,
  }) : super(key: key) {
    textSize = Utils.extraHighTextSize(context);
  }
  CustomText.custom(
    this.text,
    this.context, {
    Key? key,
    this.fontFamily,
    this.textColor,
    this.underlined = false,
    this.bold = false,
    this.centerText = false,
    this.textOverflow,
    this.textSize,
    this.maxlines,
    this.lineThrough = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontFamily: fontFamily ?? AppConstants.deafultFont,
        fontSize: textSize ?? Utils.normalTextSize(context),
        color: textColor ?? ColorTable.getTextColor(context),
        decoration: underlined
            ? TextDecoration.underline
            : lineThrough
                ? TextDecoration.lineThrough
                : null,
        fontWeight: bold ? FontWeight.bold : null,
      ),
      textAlign: centerText ? TextAlign.center : null,
      overflow: textOverflow,
      maxLines: maxlines,
    );
  }
}
