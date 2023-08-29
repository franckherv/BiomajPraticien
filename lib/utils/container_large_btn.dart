// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_colors.dart';
import 'package:flutter/material.dart';



class ConatainerLargeBtn extends StatelessWidget {

  String? btnLabel = '';
  final Function()? onPressAction;

  Color? borderColor;
  Color? labelColor;
  Color? btnColor;

   ConatainerLargeBtn({
    @required this.btnLabel,
    this.onPressAction,
    @required this.borderColor,
    @required this.btnColor,
    @required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: Container(
        height: 70.0,
        //width: 200.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: btnColor == null ? AppColors.appThemeColor : btnColor,
            //color: AppColors.appThemeColor,
          border: Border.all(
            color:  borderColor ?? AppColors.appThemeColor,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          /*gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 2.0],
              tileMode: TileMode.clamp,
              colors: [
                AppColors.darkAppThemeColor,
                AppColors.appThemeColor,
              ]),*/
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: FittedBox(
              child: Text(
                btnLabel!,
                style: TextStyle(
                    color: labelColor == null ? Colors.white : labelColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    fontFamily: 'calibriRegular'
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: onPressAction,
    );
  }
}