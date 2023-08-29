// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfiUserQrCode extends StatelessWidget {
  String? qrdata;
  Function()? onPressed;

  ProfiUserQrCode({this.qrdata, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: QrImageView(
                data: "$qrdata",
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.height / 5,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Scanner le qr code \n pour voir les informations.",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                onPressed: onPressed,
                label: const Text(
                  "Partager",
                  style:  TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appThemeColor,
                  fixedSize: const Size(208, 43),
                ),
              ),
            ) 
          ],
        ),
      ),
    );
  }


  Future<void> share() async {
    await FlutterShare.share(
        title: "",
        text: "Soutien-au-projet-Aidnov™",
        linkUrl: "widget.cat.url",
        chooserTitle: '');
  } 
}
