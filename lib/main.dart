import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/models/preferences.dart';
import 'package:biomaj/router/route_generator.dart';
import 'package:biomaj/screens/common/splash/splash_screen.dart';
import 'package:biomaj/state_manager/global_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';


Box? box1;
void main() async {
   await Hive.initFlutter();
  box1 = await Hive.openBox('logindata');
  runApp(const MyApp());
}

// 0779645148
// ts12345
// MATRICULE: 63a38e613f668


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //MaterialColor color = new MaterialColor(0xFF93cd48, AppColors.colorCodes);
  // 0xffF8742C code color orange
    return ScreenUtilInit(
      designSize: const Size(360, 690), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return MultiProvider(
          providers: [
          ChangeNotifierProvider(
            create: (__) => GlobalStateManager(),
          ),
        ],
          child: MaterialApp(
              //locale: DevicePreview.locale(context), // Add the locale here
              //builder: DevicePreview.appBuilder, // Add the builder here
              title: 'biomaj',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'calibriRegular',
                primarySwatch: AppColors.appMaterialColor,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              // localizationsDelegates: const [
              //   // GlobalMaterialLocalizations.delegate,
              //   // GlobalWidgetsLocalizations.delegate,
              //   // GlobalCupertinoLocalizations.delegate,
              // ],
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('fr', 'FR'), 
              ],
              //initialRoute: '/',
              onGenerateRoute: RouteGenerator.generateRoute,
              home: SplashScreen(
                initialFutures: [
                  SharedPrefs.init(),
                  //Firebase.initializeApp()
                ],
              )),
        );
      },
    );
  }
}
 
 





