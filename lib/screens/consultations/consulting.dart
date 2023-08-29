// ignore_for_file: unused_field

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/screens/common/bottom_tab/add_bottom_appbar.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'create_consulting/create_consulting.dart';

class ConsultingScreen extends StatefulWidget {
  const ConsultingScreen({Key? key}) : super(key: key);

  @override
  State<ConsultingScreen> createState() => _ConsultingScreenState();
}

class _ConsultingScreenState extends State<ConsultingScreen> {

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";

  // List<ConsultationModel> _rdvList = [];
  // List<Ordonnance> _rdvList = [];

  List<ListConsultingHospital> _consultingList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Consultation",
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
                                  Navigator.of(context).pushNamed('/list-consultation');
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: const Text(
                                  "Liste des consultations",
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
                                  Navigator.of(context).pushNamed(
                                      '/create-consulting-screen',
                                      arguments: CreateConsultingScreen(
                                          selectedPage: 0));
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: const Text(
                                  "Créer une consultation",
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
