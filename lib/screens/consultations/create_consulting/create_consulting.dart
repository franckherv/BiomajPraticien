// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/screens/consultations/create_consulting/new_consulting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateConsultingScreen extends StatefulWidget {
  int? selectedPage;

  CreateConsultingScreen({
    Key? key,
    this.selectedPage,
  }) : super(key: key);

  @override
  _CreateConsultingScreenState createState() => _CreateConsultingScreenState();
}

class _CreateConsultingScreenState extends State<CreateConsultingScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.selectedPage!,
      length: 1,
      child: Scaffold(
          appBar: appBarmenu(
              context: context,
              title: "Constante",
              bgClr: Colors.white,
              color: Colors.black,
              elevation: 0),
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
            child: Column(
              children: [
                const SizedBox(
                  height: 100.0,
                  //color: Colors.white,
                ),
                Expanded(
                  // flex: 3,
                  child: Container(
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
                          color: Colors.black,
                          spreadRadius: 0.5,
                          blurRadius: 8,
                          offset: Offset(0.7, 0.7),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setHeight(20),
                          vertical: ScreenUtil().setHeight(15)),
                      child: Column(
                        children: [
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(
                                12.0,
                              ),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  AppImages.fontdecran,
                                ),
                              ),
                            ),
                            child: TabBar(
                              isScrollable: true,
                              controller: _tabController,
                              onTap: (index) {
                                setState(() {
                                });
                              },
                              // give the indicator a decoration (color and border radius)
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                color: AppColors.appThemeColor,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              labelStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                              tabs: const [
                                Tab(
                                  child: Text(
                                    'Constante',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // tab bar view here
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: const [
                                NewConsultingScreen(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
