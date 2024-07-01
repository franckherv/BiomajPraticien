import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/main.dart';
import 'package:biomaj/models/category_list.dart';
import 'package:biomaj/models/pub_list.dart';
import 'package:biomaj/services_simulation/api_services_simulation.dart';
import 'package:biomaj/widgets/categoryDataWidget.dart';
import 'package:biomaj/widgets/drawer_menu/drawer_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Pub> _pub = [];
  List<Category> _category = [];

  final ApiServiceSimulation _api = ApiServiceSimulation();

  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pub = _api.getpubList(fake: true);
    _category = _api.getcategoryList(fake: true);
    openBox();
  }

  void openBox() async {
    box1 = await Hive.openBox('logindata');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawermenu(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                '/uer-account',
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  AppImages.usericon,
                  height: 80,
                  width: 80,
                ),
              ),
            ),
          ),
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
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setHeight(20),
              vertical: ScreenUtil().setHeight(10)),
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Bonjour ${box1?.get('name')} 👋",
                      style: AppDesign.messervice,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Ravis de vous revoir !"),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: ScreenUtil().setHeight(150),
                      viewportFraction: 1,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 16 / 9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: _pub.map((pub) {
                      return Builder(builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(10),
                              horizontal: ScreenUtil().setHeight(3)),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage(pub.image!),
                                    fit: BoxFit.cover)),

                            // height: MediaQuery.of(context).size.height*0.10,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              pub.name!,
                              style: AppDesign.youhaveaccoumpt,
                            ),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _pub.map((urlOfItem) {
                        int index = _pub.indexOf(urlOfItem);
                        return Container(
                            width: 30.0,
                            height: 5.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: _currentIndex == index
                                  ? AppColors.appThemeColor
                                  : Colors.green[100],
                            ));
                      }).toList()),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(50),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: _category.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryWidget(
                      cat: _category[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
