// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RoundedTextInputFieldWithBorder extends StatelessWidget {
  String? label;
  String? hintText;
  String? helpText;
  TextInputAction? inputAction;
  TextInputType? inputType;
  TextEditingController? imputCtrl;
  Widget? prefixT;
  Color? textColor;
  Color? inputColor;
  double? tailText;
  bool? obscure;
  Icon? prefixIcn;
  bool? enabled = true;
  int? maxLines;
  Icon? suffixIcn;
  String? validate;

  RoundedTextInputFieldWithBorder({
    @required this.label,
    @required this.imputCtrl,
    @required this.inputType,
    @required this.inputAction,
    this.prefixT,
    this.hintText,
    this.helpText,
    this.maxLines,
    @required this.textColor,
    @required this.inputColor,
    @required this.tailText,
    this.obscure,
    this.prefixIcn,
    this.enabled,
    Icon? suffixIcn,
    this.validate = "Champ incorrect",
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: obscure ?? false,
      maxLines: maxLines == null ? null : maxLines,
      keyboardType: inputType ?? TextInputType.multiline,
      controller: imputCtrl,
      enabled: enabled,
      // maxLength: maxtail != null ? maxtail : 200,
      textInputAction: inputAction,
      validator: (value) {
        if (value!.isNotEmpty) {
          return '$validate';
        }
        return null;
      },
      style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,),
      decoration: InputDecoration(
        border: InputBorder.none, 
    
        prefixIcon: prefixIcn, 
        isDense: false,
        contentPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
        labelText: label,
        prefix: prefixT,
        hintText: hintText,
        helperText: helpText,
        suffixIcon: const Icon(
          Icons.edit_outlined,
        ),
        labelStyle: TextStyle(
            color: textColor, 
            fontWeight: FontWeight.bold,
            fontSize: 15, 
            fontFamily: 'calibriRegular'),
        hintStyle: TextStyle(
            color: textColor, fontSize: 15, fontFamily: 'calibriRegular'),
        helperStyle: TextStyle(
          color: textColor,
          fontSize: 13,
          fontFamily: 'calibriRegular',
        ),
        filled: true,
        fillColor: Colors.white, 
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(5.0),
        //   borderSide: BorderSide(color: Colors.white, width: 1.0),
        // )
      ),
    );
  }
}
