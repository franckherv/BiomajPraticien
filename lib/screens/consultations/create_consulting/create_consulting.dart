// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, library_private_types_in_public_api
import 'package:biomaj/constants/appBar.dart';
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
                            decoration: const BoxDecoration(
                              image:  DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  AppImages.fontdecran,
                                ),
                              ),
                            ),
                            child: const Text('Veuillez renseigner les informations ci-dessous', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
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
