import 'dart:convert';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/user_model.dart';
import 'package:biomaj/screens/common/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../appKey/app_key.dart';
import '../loading/loading_spinner.dart';

class Drawermenu extends StatefulWidget {
  @override
  State<Drawermenu> createState() => _DrawermenuState();
}

class _DrawermenuState extends State<Drawermenu> {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  String barcode = "";

  late Box box;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  void openBox() async {
    box = await Hive.openBox('logindata');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: double.infinity,
      child: Drawer(
        child: Column(
          children: [
           
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    AppImages.appLogoPng,
                    width: 40,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AppImages.closebutton,
                        width: 25,
                      )),
                ],
              ),
            ),

            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: Image.asset(
                AppImages.homeImage,
                width: 20,
              ),
              title: const Text(
                'Accueil',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: Image.asset(
                AppImages.consultation,
                width: 20,
              ),
              title: const Text(
                'Consultation',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/consulting-screen');
              },
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: Image.asset(
                AppImages.microscope,
                width: 20,
              ),
              title: const Text(
                "Résultat d'analyse",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/examen-screen');
              },
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const Icon(Icons.qr_code_2, color: AppColors.appMaterialColor,),
              title: const Text(
                "Scan QRCODE",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Navigator.of(context).pop();
                scanPatientQR();
              },
            ),

            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: Image.asset(
                AppImages.ordonnanance,
                width: 20,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/uer-account');
              },
            ),
            const Spacer(
                //flex: 3,
                ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                'Déconnexion',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                box.put('isLogged', false);
                box.delete('contact');
                box.delete('password');
                box.delete('name');
                box.delete('prenom');
                box.delete('lienimageuser');
                box.delete('token');
                displayToastmessage("Compte déconnecté avec succès", context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => OnBoardingScreen()));
              },
            ),
           Container(
              color: Colors.grey[200],
              width: double.infinity,
              height: ScreenUtil().setHeight(100),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ListTile(
                      title: const Text(
                        "Service d'assistance",
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.black54),
                      ),
                      trailing: Image.asset(
                        AppImages.appLogoPng,
                        width: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.phone_rounded,
                              size: 15, color: Colors.black54),


                          Text(
                            "(+225) 07 07 40 9341",
                            style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                      // trailing: Image.asset(AppImages.edutech, width: 90,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(35)),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.email_outlined,
                              size: 15, color: Colors.black54),
                          Text(
                            "info@biomaj.net",
                            style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                      // trailing: Image.asset(AppImages.edutech, width: 90,),
                    ),
                  ),
                ],
              ),
            ),
          
            // SizedBox(
            //   height: ScreenUtil().setHeight(10),
            // )
          ],
        ),
      ),
    );
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }

  Future scanPatientQR() async {
    try {
      await BarcodeScanner.scan().then((value) {
        setState(() {
          barcode = value.rawContent.toString();
        });
        if (barcode.isNotEmpty) {
          Future.delayed(const Duration(milliseconds: 0), () {
            fetchPatientData(barcode);
          });
        }
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => barcode = 'Unknown error: $e');
    }
  }

  fetchPatientData(String scanResult) async {
    LoadingSpinner.showLoadingDialog(
        context, _keyLoader, 'Chargement en cours');
    await httpGlobalDatasource
        .getPatientInfo(matricule: scanResult)
        .then((data) {
      Navigator.of(context).pop();
      User userData = User.fromJson(data.toJson());
      box.put(AppKeys.patient, json.encode(userData));
      Navigator.of(context).pushNamed('/info-patient');
    }).catchError((err) {
      Navigator.of(context).pop();
      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }
}
