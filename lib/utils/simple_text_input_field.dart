// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SimpleTextInputField extends StatelessWidget {
  String? label;
  String? hintText;
  TextInputAction? inputAction;
  TextInputType? inputType;
  TextEditingController? imputCtrl;
  Widget? prefixT;
  Color? textColor;
  Color? inputColor;
  double? tailText;
  Color? barFocusColor;
  Color? barColor;
  bool? obscure;

  SimpleTextInputField({
    @required this.label,
    @required this.imputCtrl,
    @required this.inputType,
    @required this.inputAction,
    this.prefixT,
    this.hintText,
    @required this.textColor,
    @required this.inputColor,
    @required this.tailText,
    @required this.barFocusColor,
    @required this.barColor,
    this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: obscure ?? false,
      keyboardType: inputType,
      controller: imputCtrl,
      // maxLength: maxtail != null ? maxtail : 200,
      textInputAction: inputAction,
      validator: (value) {
        if (value!.isNotEmpty) {
          return 'Please fill this field';
        }
        return null;
      },
      style: TextStyle(color: inputColor, fontSize: tailText),
      decoration: InputDecoration(
        fillColor: Colors.white,
        //  prefix: prefix,
        //prefixIcon: prefixIcn,
        isDense: false,
        contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
        labelText: label,
        prefix: prefixT,
        hintText: hintText,
        labelStyle: TextStyle(
            color: textColor, fontSize: 15, fontFamily: 'calibriRegular'),
        hintStyle: TextStyle(
            color: textColor, fontSize: 15, fontFamily: 'calibriRegular'),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: barColor ?? Colors.white, width: 0.3),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: barFocusColor ?? Colors.white),
        ),
      ),
    );
  }
}
