// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, library_private_types_in_public_api
import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/screens/consultations/ordonnance/ordonnance.dart';
import 'package:biomaj/widgets/profil_userInfo_widget/profil_user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'consu_examen/consu_examen.dart';
import 'observation/observation_screen.dart';

class DetailConsultationScreen extends StatefulWidget {
  int? selectedPage;
  ListConsultingHospital? consultatingData;
  DetailConsultationScreen({
    Key? key,
    this.selectedPage,
    this.consultatingData,
  }) : super(key: key);

  @override
  _DetailConsultationScreenState createState() =>
      _DetailConsultationScreenState();
} 

class _DetailConsultationScreenState extends State<DetailConsultationScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex = 0;
 

 
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    DefaultTabController(
      initialIndex: widget.selectedPage!,
      length: 4,
      child: Scaffold(
          appBar: appBarmenu(
              context: context,
              title: _selectedIndex == 0
                  ? "Détail consultation"
                  : _selectedIndex == 1
                      ? "Observation" : _selectedIndex == 2 ? "Ordonnance"
                      : "Examen",
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
                const SizedBox(
                  height: 100.0,
                ),
                Expanded(
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
                                  _selectedIndex = index;
                                });
                              },
                              // give the indicator a decoration (color and border radius)
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppColors.appThemeColor,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              labelStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                              tabs: const [
                                Tab(
                                  child: Text(
                                    'information',
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Observation',
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Ordonnance',
                                  ),
                                ),
                                 Tab(
                                  child: Text(
                                    'Examen',
                                  ),
                                ),
                              ],
                            ),
                          
                          
                          ),
                          // tab bar view here
                          Expanded(
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _tabController,
                              children: [
                                 ConsultationUserInfoWidget(consultatingData: widget.consultatingData),
                                 ObservationScreen(consultatingData: widget.consultatingData),  
                                 OrdonnanceScreen(consultatingData: widget.consultatingData) ,
                                 ConsuExamenScreen(consultatingData: widget.consultatingData) 
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
