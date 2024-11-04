import 'package:biomaj/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.appThemeColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                  AppImages.appLogoPng,
                height: ScreenUtil().setHeight(90),
                width: ScreenUtil().setHeight(90),
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 0.0,
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24, color: Colors.black, fontFamily: 'Poppins'),
                  //overflow: TextOverflow.visible,
                ),
              ),

              //SizedBox(height: 10.0,),

              const Padding(
                padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                child: Text(
                  "Rejoignez notre communauté et découvrez une nouvelle façon de gérer votre santé. En vous inscrivant, vous accéderez à un suivi médical en temps réel, des notifications importantes et des ressources santé exclusives.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, color: Colors.black, fontFamily: 'Poppins'),
                  //overflow: TextOverflow.visible,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
