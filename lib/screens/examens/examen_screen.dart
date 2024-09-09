// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/screens/common/bottom_tab/add_bottom_appbar.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:biomaj/widgets/drawer_menu/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamenScreen extends StatefulWidget {
  @override
  State<ExamenScreen> createState() => _ExamenScreenState();
}

class _ExamenScreenState extends State<ExamenScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawermenu(),
        appBar: AppBar(
          title: const Text(
            "Analyses",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              icon: const ImageIcon(
                AssetImage(AppImages.backButton),
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/shared_bottom_app_bar', (Route<dynamic> route) => false,
                    arguments: SharedBottomAppBar(
                      defauldIndex: 0,
                    ));
              }),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0.w, top: 5.h, bottom: 2.h),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/new-exam-create');
                },
                elevation: 2.0,
                fillColor: AppColors.appThemeColor,
                child: Icon(
                  Icons.add,
                  size: 25.0,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
              ),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AppImages.fontdecran,
              ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: ScreenUtil().setHeight(40),
                  child: Image.asset(
                    AppImages.analyseLogo,
                    width: 250.0,
                    height: 200.0,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AppImages.fontdecran,
                      ),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.1,
                        blurRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setHeight(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: double.infinity,
                                height: 45.0,
                                child: SmallRaisedBtn(
                                  width: double.infinity,
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/analyse-prescrite-screen');
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Text(
                                    "Démarer une analyse",
                                    style: AppDesign.rstpwdstyle,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: double.infinity,
                                height: 45.0,
                                child: SmallRaisedBtn(
                                  width: double.infinity,
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/analyse-termine-screen');
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Text(
                                    "Analyse en cours",
                                    style: AppDesign.rstpwdstyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
