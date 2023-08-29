import 'package:biomaj/constants/app_colors.dart';
import 'package:flutter/material.dart';



class SmallRaisedBtn extends StatelessWidget {

  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  
 // final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const SmallRaisedBtn({ 
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 50.0,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
       // gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: AppColors.appThemeColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  } 
}