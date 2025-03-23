import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

import '../../main.dart';

class UserAccount extends StatefulWidget {
  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  void initState() {
    openBox();
    super.initState();
  }

  void openBox() async {
    box1 = await Hive.openBox('logindata');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Padding(
                      padding:  EdgeInsets.only(top: 80.0, left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
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
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Informations personnelles",
                      style: AppDesign.messervice),
                ),
              ),
              Expanded(child: Container()),
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
                        spreadRadius: 0.1,
                        blurRadius: 2,
                        offset: Offset(0.9, 0.9),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(20)),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.only(
                                left: 18.0, right: 18, top: 5, bottom: 0),
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            title: const Text("Nom:", style: AppDesign.messervice,),
                            trailing: Text("${box1?.get('name')}"),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.only(
                                left: 18.0, right: 18, top: 5, bottom: 0),
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            title: const Text("Prenom:", style: AppDesign.messervice,),
                            trailing: Text("${box1?.get('prenom')}"),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.only(
                                left: 18.0, right: 18, top: 5),
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            title: const Text("Contact:", style: AppDesign.messervice,),
                            trailing: Text("${box1?.get('contact')}"),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.only(
                                left: 18.0, right: 18, bottom: 20),
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            title: const Text("Spécialité:", style: AppDesign.messervice,),
                            trailing: Text("${box1?.get('specialite').join(", ")}"),
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));


  }

    displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
