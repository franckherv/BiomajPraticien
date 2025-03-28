
import 'package:biomaj/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {

  @override
  Widget build(BuildContext context) {

  //  ScreenUtil.init(context, width: 414, height: 896, allowFontScaling: false);

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
                      fontSize: 24,
                      color: Colors.black,
                      fontFamily: 'Poppins'),
                  //overflow: TextOverflow.visible,
                ),
              ), 

              //SizedBox(height: 10.0,),

              const Padding(
                padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                child:  Text(
                  "Prenez le contrôle de votre bien-être. Connectez-vous dès maintenant pour bénéficier de conseils personnalisés, de consultation et de prescription avec des professionnels de santé.",
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'Poppins'),
                  //overflow: TextOverflow.visible,
                ),
              ),

//              SizedBox(
//                height: 100.0,
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
