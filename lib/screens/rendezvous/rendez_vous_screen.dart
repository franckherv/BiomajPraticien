import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RendezVousScreen extends StatefulWidget {
  @override
  State<RendezVousScreen> createState() => _RendezVousScreenState();
}

class _RendezVousScreenState extends State<RendezVousScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarmenu(
          context: context,
          title: "Rendez-vous",
          bgClr: Colors.white,
          color: Colors.black,
          elevation: 0),
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
              child: Container(
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
                                  Navigator.pushNamed(
                                      context, '/appointement-screen');
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: const Text(
                                  "Prendre un rendez-vous",
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
                                 Navigator.of(context).pushNamed('/mes-rendez-vous-vue');
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: const Text(
                                  "Voir mes rendez-vous",
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
    );
  }
}
