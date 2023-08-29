// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogBox extends StatefulWidget {
  final String? image, descriptions;

  Function()? leftTap;
  Function()? rightTap;

  CustomDialogBox(
      {Key? key, this.image, this.descriptions, this.leftTap, this.rightTap})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      height: ScreenUtil().setHeight(250),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setHeight(10)),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Expanded(
              flex: 3,
              child: Column(
              children: [
                Image.asset(
              AppImages.validation,
              width: 150,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.descriptions!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
              ],
             )),
           // Spacer(),
            Expanded(
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
               
                Expanded(
                  child: TextButton(
                      child: const Text("Non",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      onPressed: widget.leftTap),
                ),
                const SizedBox(width: 10),

                 Expanded(
                  child: TextButton(
                      child: const Text("Oui",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      onPressed:  widget.rightTap),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
