import 'package:biomaj/constants/app_colors.dart';
import 'package:flutter/material.dart';



class LoadingSpinner {

  final String? loadingMessage;

  LoadingSpinner({Key? key, @required this.loadingMessage}) ;

  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key, loadingMessage) async {

    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return  Dialog(
      backgroundColor: AppColors.appThemeColor,
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              SizedBox(width: 6.0),
              CircularProgressIndicator(),
              SizedBox(width: 26.0),
              Text(
                loadingMessage,
                style: TextStyle(color: Colors.black, fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
        }
        );
  }
}