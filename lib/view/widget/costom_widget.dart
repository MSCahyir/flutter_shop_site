import 'package:ferisoft/constant/app_cons.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

InputDecoration inputDecoration(
    {IconData? prefixIcon,
    String? hint,
    Color? bgColor,
    Color? borderColor,
    EdgeInsets? padding}) {
  return InputDecoration(
    contentPadding:
        padding ?? const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    counter: const Offstage(),
    fillColor: bgColor ?? grey.withOpacity(0.14),
    hintText: hint,
    prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: appColor) : null,
    hintStyle: secondaryTextStyle(),
    filled: true,
  );
}
