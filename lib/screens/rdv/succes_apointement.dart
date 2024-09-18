import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/screens/common/bottom_tab/add_bottom_appbar.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SuccesAppointement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          //color: Colors.white.withOpacity(0.4),
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
        child: Padding(
          padding: EdgeInsets.all(
            ScreenUtil().setHeight(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Lottie.asset("assets/animation/success.json"),
                   const Align(
                    alignment: Alignment.center,
                    child:  Text(
                      "Félicitation votre enrégistrement a",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                   const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "été prise en compte.",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
              
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 45.0,
                        child: SmallRaisedBtn(
                          width: double.infinity,
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/shared_bottom_app_bar',
                                (Route<dynamic> route) => false,
                                arguments: SharedBottomAppBar(
                                  defauldIndex: 0,
                                ));
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: const Text(
                            "Quitter",
                            style: AppDesign.rstpwdstyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
           // SizedBox(height: ScreenUtil().setHeight(30),),
            ],
          ),
        ),
      ),
    );
  }
}