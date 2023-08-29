
// ignore_for_file: must_be_immutable, unused_field

import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/models/user_model.dart';
import 'package:biomaj/widgets/profil_userInfo_widget/profil_user_info_widget.dart';
import 'package:biomaj/widgets/profil_userInfo_widget/profil_user_qrcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilScreen extends StatefulWidget {
  int? selectedPage;
  ProfilScreen({this.selectedPage});

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen>
    with SingleTickerProviderStateMixin {
 final UserModel _userModel = UserModel(
  name: "John Doe",
  email: "johnDoe@gmail.com",
  contact: "0101010101",
  profession: "Mobile developper",
  groupSan: "O+",
  maladiChroniq: "N.A",
  alergie: "N.A",
  antecedent: Antecedent(
    name: "Pierre Giroud",
    email: "giraud@gmail.com",
    contact: "0202020202",
    profession: "Policier"
    )
  );
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.selectedPage!,
      length: 2,
      child: Scaffold(
          appBar: appBarmenu(
              context: context,
              title: "",
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
                SizedBox(
                  height: 200.0,
                  //color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Stack(fit: StackFit.loose, children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AppImages.usericon),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 80.0, left: 40.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 15.0,
                                    child: Icon(
                                      Icons.edit,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              )),
                        ]),
                      ),
                    ],
                  ),
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
                            // height: 40,
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
                              controller: _tabController,

                              // give the indicator a decoration (color and border radius)
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  12.0,
                                ),
                                color: AppColors.appThemeColor,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              labelStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              tabs: const [
                                Tab(
                                  child: Text(
                                    'Mes informations',
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Mon Qr code',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // tab bar view here
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                             ConsultationUserInfoWidget(),
                             ProfiUserQrCode(qrdata: "the qr data",onPressed: () { },)
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
