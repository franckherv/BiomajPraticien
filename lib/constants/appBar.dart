import 'package:biomaj/constants/app_images.dart';
import 'package:flutter/material.dart';

AppBar appBarmenu(
    {BuildContext? context,
    String? title,
    Color? color,
    List<Widget>? action,
    double? elevation,
    Color? bgClr}) {
  return AppBar(
    // leading: const BackButton(),

    title: Text(
      title!,
      style: TextStyle(color: color, fontSize: 18),
    ),
    backgroundColor: bgClr,
    centerTitle: true,
    elevation: elevation,
    actions: action,
    leading: IconButton(
      icon: const ImageIcon(
        AssetImage(AppImages.backButton),
        color: Colors.black,
      ),
      onPressed: () => {Navigator.of(context!).pop()},
    ),
    // automaticallyImplyLeading: false,
  );
}
