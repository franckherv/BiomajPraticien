// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class RoundedRaisedButton extends StatelessWidget {


  String? label = "";
  final Function()? onPressAction;
  Color? btnColor;

  RoundedRaisedButton({@required this.label, this.btnColor, @required this.onPressAction});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressAction,
      child: Text(
          label!,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'calibriRegular'
          )
      ),
      //color: AppTheme.deepBlueMainColor,
      // color: btnColor,
      // textColor: Colors.white,
      // elevation: 0,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(25)
      // ),
    );
  }
}