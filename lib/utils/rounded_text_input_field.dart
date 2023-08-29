import 'package:biomaj/constants/app_colors.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class RoundedTextInputField extends StatelessWidget {
  var label;
  Icon? prefixIcn;
  TextInputAction? inputAction;
  TextInputType? inputType;
  TextEditingController? imputCtrl;
  ValueChanged<String>? onChanged;
  Widget? inpuSufix;
  int? maxLines;
  bool? readOnly;
  bool? enable = true;
  bool? obscure;
  String? hintTextValue;
  bool? autofocus = false;

  Color? borderColor = Colors.transparent;
  double? borderWidth = 0.0;
  String? validatorTest;

  RoundedTextInputField(
      {Key? key,
      this.label,
      @required this.imputCtrl,
      @required this.inputType,
      @required this.inputAction,
      @required this.autofocus,
      this.prefixIcn,
      this.obscure,
      this.borderColor,
      this.borderWidth,
      this.onChanged,
      this.inpuSufix,
      this.maxLines,
      this.hintTextValue,
      this.readOnly,
      this.validatorTest,
      this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autofocus: autofocus!,
      obscureText: obscure ?? false,
      keyboardType: inputType,
      maxLines: maxLines ?? 1,
      readOnly: ((readOnly == null)) ? false : true,
      enabled: enable,
      // textCapitalization: label == "Votre message"
      //     ? TextCapitalization.sentences
      //     : TextCapitalization.none,
      controller: imputCtrl,
      textInputAction: inputAction,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      validator: (value) {
        if (value!.isEmpty) {
          return validatorTest!.trim();
        }
        return null;
      },

      decoration: InputDecoration(
        border: InputBorder.none,
          errorStyle: const TextStyle(color: AppColors.appThemeColor),
          prefixIcon: prefixIcn,
          isDense: false,
          contentPadding:
              const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0),
          label: label,
          labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black),
           filled: true,
           fillColor: Colors.grey[100],
          hintText: hintTextValue,
         
          hintStyle: TextStyle(fontSize: 15, color: Colors.black54,
         ),
          suffix: inpuSufix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.appThemeColor,
                width: borderWidth ?? 1),
          )),
    );
  }
}