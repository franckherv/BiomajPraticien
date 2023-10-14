// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_colors.dart';
import 'package:flutter/material.dart';


class SimpleLoaderWidget extends StatelessWidget {

  bool isLoading;
  String message = "Chargement en cours ...";


  SimpleLoaderWidget({required this.isLoading, required this.message});


  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
        onWillPop: () async => true,
        //onWillPop: () async => !isLoading,
        child: SimpleDialog(
            //key: key,
            backgroundColor: Colors.white,
            children: <Widget>[

              Center(
                child: Column(
                    children: [
                      const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(AppColors.appThemeColor)
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        message,
                        style: const TextStyle(
                            color: AppColors.appThemeColor
                        ),
                      )
                    ]
                ),
              )
            ]));

    /*return Container(
      child: isLoading
          ? Container(
        child: AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              Container(
                //margin: const EdgeInsets.only(left: 15.0),
                child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(message),
                    )),
              )
            ],
          ),
        ),
        color: Colors.black54.withOpacity(0.2),
      )
          : Container(),
    );*/
  }
}