import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';
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
  bool hasTextBorder = false;
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
  CustomText.withBorder(
    this.text,
    this.context, {
    Key? key,
    this.hasTextBorder = true,
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
    return hasTextBorder
        ? Stack(
            alignment: Alignment.center,
            children: [
              TextSide(context, isBehindText: true),
              TextSide(context),
            ],
          )
        : TextSide(context);
  }

  Text TextSide(BuildContext context, {bool isBehindText = false}) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontFamily: fontFamily ?? AppConstants.deafultFont,
        fontSize: (textSize ?? Utils.normalTextSize(context)) * (isBehindText ? 1.1 : 1),
        color: isBehindText ? Theme.of(context).scaffoldBackgroundColor : textColor ?? ColorTable.getTextColor(context),
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
