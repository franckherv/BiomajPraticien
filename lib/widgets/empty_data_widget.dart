// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class EmptyDataWidget extends StatelessWidget {

  String? message;
  String? image;

  EmptyDataWidget({
    this.image,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset(
            image!,
            fit: BoxFit.cover,
            height: 90.0,
            //width: 200.0,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              message!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontFamily: 'MontserratMedium'
              ),
            ),
          )

        ],
      ),
    );
  }
}