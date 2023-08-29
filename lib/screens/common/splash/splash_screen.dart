// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/screens/common/bottom_tab/add_bottom_appbar.dart';
import 'package:biomaj/screens/common/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  Color? backgroundColor = Colors.white;
  TextStyle? styleTextUnderTheLoader = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);
  final List<Future>? initialFutures;
  SplashScreen({this.initialFutures});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 3;

  Box? box1;

  @override
  void initState() {
    super.initState();

    openBox();

    _loadWidget();
  }

  void openBox() async {
    box1 = await Hive.openBox('logindata');
    setState(() {});
  }

  _loadWidget() async {
    var beginAt = DateTime.now();
    var second = 0;
    Duration _duration;
    //await Future.wait(widget.initialFutures,eagerError:true);
    second = DateTime.now().difference(beginAt).inSeconds;
    if (second > splashDelay) {
      _duration = const Duration(milliseconds: 100);
    } else {
      _duration = Duration(seconds: splashDelay - second);
    }

    return Timer(_duration, navigationPage);
  }

  

  Future<void> navigationPage() async {
    // var token = await Token.fromPrefs();

    final prefs = await SharedPreferences.getInstance();
    const key = 'intro_screen_viewed';

   

    //prefs.clear();

   print("====USER TOKEN ${box1?.get('token')}============");

    String? screenView = prefs.getString(key);

    if (screenView != null || box1!.get('isLogged', defaultValue: false)) {

        CommonVariable.userTken = box1?.get('token');

      Navigator.of(context).pushNamedAndRemoveUntil(
          '/shared_bottom_app_bar', (Route<dynamic> route) => false,
          arguments: SharedBottomAppBar(
            defauldIndex: 0,
          ));
    } else {    
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => OnBoardingScreen()));
      //UserModel.clear();



    }
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginTypeScreen()));
  }

  /* 
  Future<void> navigationPage() async {

    final prefs = await SharedPreferences.getInstance();
    final key = 'intro_screen_viewed';

    //prefs.clear();

    var user = await UserModel.fromPrefs();


    String screenView = prefs.getString(key);

    if(screenView == null && user == null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OnBoardingScreen()));
    }else{

      //UserModel.clear();

      if(user != null &&  user.token != null){
        CommonVariable.userTken = user.token.accessToken;
        CommonVariable.localUserDatas = user;
      }

      if(user != null && user.isVendeur){

        //Espace vendeur

        Navigator.of(context).pushNamedAndRemoveUntil(
            '/bottom-tab-boutique-widget', (Route<dynamic> route) => false,
            arguments: BottomTabBoutiqueWidget(
              pageIndex: 0,
            )
        );

      }else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/bottom-tab-widget', (Route<dynamic> route) => false,
            arguments: BottomTabWidget(
              pageIndex: 0,
            )
        );
      }

    }


    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginTypeScreen()));

  }
  */

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.appLogoPng,
                //fit: BoxFit.contain,

                height: ScreenUtil().setHeight(200),
                width: ScreenUtil().setWidth(200),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*Future initOneSignal() async {

    //Remove this method to stop OneSignal Debugging
    //OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("cfe8de45-e4ee-443e-92b5-f74ef601226a");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    /*OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });


    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent notification) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // Will be called whenever a notification is opened/button pressed.
    });*/



    var deviceState = await OneSignal.shared.getDeviceState();

    if (deviceState != null && deviceState.userId != null) {
        CommonVariable.setglobalOneSignalPlayerId = deviceState.userId;
    }

  }*/
}
