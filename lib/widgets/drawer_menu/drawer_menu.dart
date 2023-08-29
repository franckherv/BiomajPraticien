import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/screens/common/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Drawermenu extends StatefulWidget {
  @override
  State<Drawermenu> createState() => _DrawermenuState();
}

class _DrawermenuState extends State<Drawermenu> {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  // final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String loadingMessage = "Connexion en cours";

  Box? box1;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  void openBox() async {
    box1 = await Hive.openBox('logindata');
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
            //  const  UserAccountsDrawerHeader(
            //   accountName: Text("bbb",style: TextStyle(
            //       fontSize: 16.0,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.black,
            //     ),),
            //   accountEmail: Text("lll",style: TextStyle(
            //       fontSize: 16.0,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.black,
            //     ),),
            //   decoration: BoxDecoration(color: Colors.white),
            //   currentAccountPicture:  CircleAvatar(
            //     radius: 100.0,
            //    // backgroundColor: const Color(0xFF778899),
            //     backgroundImage: AssetImage(AppImages.appLogoPng)
            //   ),
            // ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    AppImages.appLogoPng,
                    width: 100,
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
              Navigator.of(context).pushNamed('/examen-screen'); 
              },
            ),
          /*  ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: Image.asset(
                AppImages.rdv,
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
              },
            ),*/

        
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
                box1?.put('isLogged', false);
                box1?.delete('contact');
                box1?.delete('password');
                box1?.delete('name');
                box1?.delete('prenom');
                box1?.delete('lienimageuser');
                box1?.delete('token');
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
                        "Développé par",
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.black54),
                      ),
                      trailing: Image.asset(
                        AppImages.edutech,
                        width: 90,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: const [
                          Icon(Icons.phone_rounded,
                              size: 15, color: Colors.black54),
                          Text(
                            "(+225) 01 01 01 01 01",
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: const [
                          Icon(Icons.email_outlined,
                              size: 15, color: Colors.black54),
                          Text(
                            "contact@edutech.pro",
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
}
