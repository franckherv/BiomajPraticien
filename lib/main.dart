import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/models/preferences.dart';
import 'package:biomaj/router/route_generator.dart';
import 'package:biomaj/screens/common/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


Box? box1;
void main() async {
  await Hive.initFlutter();
  await GetStorage.init();
  box1 = await Hive.openBox('logindata');
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return  GetMaterialApp(
              title: 'biomaj',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'calibriRegular',
                primarySwatch: AppColors.appMaterialColor,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                useMaterial3: false
              ),
              //initialRoute: '/',
              onGenerateRoute: RouteGenerator.generateRoute,
              home: SplashScreen(
                initialFutures: [
                  SharedPrefs.init(),
                ],
              )
        );
      },
    );
  }
}
 
 





