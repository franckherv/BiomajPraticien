import 'dart:convert';

import 'package:biomaj/appKey/app_key.dart';
import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../main.dart';

class InfoPatient extends StatefulWidget {
  const InfoPatient({super.key});

  @override
  State<InfoPatient> createState() => _InfoPatientState();
}

class _InfoPatientState extends State<InfoPatient> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
final userJson = box1?.get(AppKeys.patient);
final user = userJson != null ? json.decode(userJson) : null;    return Scaffold(
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
                ]),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.center,
                  child:
                      Text("Informations patient", style: AppDesign.messervice),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                flex: 3,
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
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: userJson != null ? Column(
                        children: [
                          h1("Informations personnelles"),
                          SizedBox(height: 10.h),
                          _listitle("Nom", user['nomuser'] ?? '_'),
                          _listitle("Prenom", user['prenomuser'] ?? '_'),
                          _listitle("Email", user['email'] ?? '_'),
                          _listitle("Lieu de naissance", user['lieunaissanceuser'] ?? '_'),
                          _listitle("Date de naissance", user['datenaissanceuser'] ?? '_'),
                          _listitle("Télephone", user['contact1user'] ?? '_'),
                          _listitle("Matricule", user['matriculeuser'] ?? '_'),
                           SizedBox(height: 10.h),
                           h1("Dossier médical"),
                          _listitle("CMU", user['cmu'] ?? '_'),
                          _listitle("Profession", user['profession'] ?? '_'),
                          _listitle("Secteur d'activité", user['secteur_activite'] ?? '_'),
                          _listitle("Numéro de personne à contacter", user['personne_urgeenc_chirug'] ?? '_'),
                          _listitle("Personne à contacter", user['personne_urgence'] ?? '_'),
                          _listitle("Allergie", user['allergie'] ?? '_'),
                           user['allergie'] == "Non" ? const SizedBox.shrink(): _listitle("Nom d'arllergie", user['allergie_name'] ?? '_'),
                          _listitle("Asthme", user['asthme'] ?? '_'),
                          _listitle("Diabete", user['diabete'] ?? '_'),
                          _listitle("Maladie de coeur", user['maladie_coeur'] ?? '_'),
                          _listitle("Epilepsie", user['epilepsie'] ?? '_'),
                          _listitle("Hypertension arterielle", user['hypertension_arterielle'] ?? '_'),
                          _listitle("autre_maladie", user['autre_maladie'] ?? '_'),
                          _listitle("Groupe sanguin", user['groupe_sanguin'] ?? '_'),
                          _listitle("Tension arterielle",user['tension_arterielle'] ?? '_'),
                          _listitle("Statut electrophoretique",user['statut_electrophoretique'] ?? '_'),
                          SizedBox(height: 20.h)
                        ],
                      ) : SizedBox(),
            
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Padding h1(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Container(
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(title, style: AppDesign.messervice),
          ),
        ),
      ),
    );
  }

  ListTile _listitle(String title, String libelle) {
    return ListTile(
      contentPadding:
          const EdgeInsets.only(left: 18.0, right: 18, top: 5, bottom: 0),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: Text(title),
      trailing: Text(
        libelle,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
