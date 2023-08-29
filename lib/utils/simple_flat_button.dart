// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class SimpleFlatBtn extends StatelessWidget {

  String? label;
  final Function()? onPressAction;
  Color? textColor;
  bool? underlineTitle = false;
  Color? btnColor;
  double? borderRadius;

  SimpleFlatBtn({
    @required this.label,
    this.onPressAction,
    this.textColor,
    this.underlineTitle,
    this.btnColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressAction,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
      //     side: BorderSide(color: btnColor ?? Colors.white)
      // ),
      child: Text(
        label!,
        style: TextStyle(
            color: textColor,
            fontSize: 15,
            fontFamily: 'calibriRegular',
            decoration: underlineTitle! ? TextDecoration.underline : TextDecoration.none
        ),
      ),
    );
  }
}