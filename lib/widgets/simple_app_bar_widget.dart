
import 'package:biomaj/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



AppBar SimpleAppBarWidget({String? title, required bool showLeading, BuildContext? context}){

  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.appThemeColor,
    centerTitle: true,
    leading: showLeading && showLeading ? IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed:()=> Navigator.pop(context!)) : Container(),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin:  FractionalOffset(0.0, 0.0),
            end:  FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
            colors: [
            //  AppColors.darkAppThemeColor,
              AppColors.appThemeColor,
            ]),
      ),
      child: FlexibleSpaceBar(
        centerTitle: true,
        title: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: ScreenUtil().setHeight(10)),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: ScreenUtil().setHeight(50),
              child: Padding(
                padding: EdgeInsets.only(right: 30.0, top: ScreenUtil().setHeight(15)),
                child: Text(
                  title!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setWidth(20),
                      fontFamily: 'MontserratMedium'
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    bottom: PreferredSize(
        child: Container(
          color: AppColors.appThemeColor,
          height: 1.0,
        ),
        preferredSize: Size.fromHeight(4.0)
    ),
    /*actions: [

      Padding(
        padding: EdgeInsets.only(right: 10.0, top: 30.0),
        child: InkWell(
          child: Badge(
            elevation: 0,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 27,
            ),
            badgeContent: Text(
              '1',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  fontFamily: 'MontserratMedium'),
            ),
            toAnimate: false,
          ),
          onTap: () {
            /*Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Panier()),
            );*/
          },
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 20.0, top: 30.0),
        child: InkWell(
          child: Badge(
            elevation: 0,
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 27,
            ),
            badgeContent: Text(
              '1',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  fontFamily: 'MontserratMedium'),
            ),
            //toAnimate: false,
          ),
          onTap: () {
//            Navigator.of(context).push(
//              MaterialPageRoute(
//                  builder: (context) =>
//                      NotificationsScreen()
//              ),
//            );
          },
        ),
      ),

    ],*/

  );
}

