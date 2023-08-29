import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:flutter/material.dart';


import 'widgets/page_one.dart';
import 'widgets/page_three.dart';
import 'widgets/page_two.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0, keepPage: false);

  int? index = 0;

  List? pages = [
    PageOne(),
    PageTwo(),
    PageThree(),
  ];

  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black54;

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 414, height: 896, allowFontScaling: false);

    return Scaffold(
      //extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (val) {
              setState(() {
                index = val;
              });
            },
            controller: controller,
            itemCount: pages!.length,
            itemBuilder: (BuildContext ctx, postition) {
              return pages![postition];
            },
          ),
          Positioned(
              bottom: 10.0,
              left: 00.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          got(index, 0),
                          const SizedBox(
                            width: 5.0,
                          ),
                          got(index, 1),
                          const SizedBox(
                            width: 5.0,
                          ),
                          got(index, 2),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25.0),
                      child: SizedBox(
                       width: 300,
                        height: 50.0,
                        child: SmallRaisedBtn(
                       
                          borderRadius: BorderRadius.circular(20),
                        
                          child: index == 2 ? const Text("Démarrer") : const Text("Suivant"),

                          onPressed: () {
                            if (index == 0) {
                              controller.animateToPage(1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            } else if (index == 1) {
                              controller.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            } else {
                              Navigator.of(context).pushNamed(
                                '/Sigin-screen', 
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    /*if (index == 2)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          width: 300,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white)
                          ),
                          child: smallRaisedBtn(
                            label: "Voir un aperçu de l'appli  ➔",
                            btnColor: Colors.transparent, //AppColors.deepBlueColor,
                            labelColor: Colors.white,
                            onPressAction: () {

                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          TabBarBottomWidget()));
                              */
                            },
                          ),
                        ),
                      ),*/
                  ],
                ),
              )),

          //  Align(
          //     alignment: Alignment.topCenter,
          //     child: Padding(
          //       padding: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
          //       child: Image.asset(
          //         AppImages.appLogoPng,
          //         fit: BoxFit.contain,
          //         width: ScreenUtil().setWidth(100),
          //         height: ScreenUtil().setHeight(100),
          //         //color: Colors.white,
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }

  Widget got(index, i) {
    return Container(
      height: index == i ? 15.0 : 8.0,
      width: index == i ? 15.0 : 8.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.appThemeColor,),
    );
  }
}
