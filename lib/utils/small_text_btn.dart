// ignore_for_file: camel_case_types, must_be_immutable

import 'package:biomaj/constants/app_colors.dart';
import 'package:flutter/material.dart';

class smallTextBtn extends StatelessWidget {
  String? label;
  final Function()? onPressAction;

  smallTextBtn({Key? key, this.label, this.onPressAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(label!),
      style: TextButton.styleFrom(
        primary: AppColors.appThemeColor,
        textStyle: const TextStyle(
          
            color: Colors.black, fontSize: 20, decoration: TextDecoration.underline),
      ),
      onPressed: onPressAction,
    );
  }
}
