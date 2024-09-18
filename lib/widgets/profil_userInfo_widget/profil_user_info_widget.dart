// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/main.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../datasources/http_global_datasource.dart';

class ConsultationUserInfoWidget extends StatefulWidget {
  ListConsultingHospital? consultatingData;
  ConsultationUserInfoWidget({Key? key, this.consultatingData})
      : super(key: key);

  @override
  State<ConsultationUserInfoWidget> createState() => _ConsultationUserInfoWidgetState();
}

class _ConsultationUserInfoWidgetState
    extends State<ConsultationUserInfoWidget> {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  String loadingMessage = "Patientez svp";

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 18.0, right: 18, top: 5, bottom: 0),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: const Text("Date consultation"),
                  trailing: widget.consultatingData!.createdAt != null
                      ? Text(CommonVariable.ddMMYYFormat.format(DateTime.parse(
                          widget.consultatingData!.createdAt.toString())))
                      : Text("Vide"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 18.0, right: 18, top: 5, bottom: 0),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: const Text("Nom"),
                  trailing:
                      Text("${widget.consultatingData!.patient!.nomuser}"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 18.0, right: 18, top: 5, bottom: 0),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: const Text("Prenom"),
                  trailing:
                      Text("${widget.consultatingData!.patient!.prenomuser}"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 18.0, right: 18, top: 5, bottom: 0),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: const Text("Matricule"),
                  trailing: Text(
                      "${widget.consultatingData!.patient!.matriculeuser}"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 18.0, right: 18, top: 5, bottom: 0),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: const Text("Tension"),
                  trailing: Text("${widget.consultatingData!.tension} mmHg"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 18.0, right: 18, top: 5, bottom: 0),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: const Text("Poids"),
                  trailing: Text("${widget.consultatingData!.poids} KG"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 18.0, right: 18, top: 5, bottom: 0),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: const Text("Température"),
                  trailing: Text("${widget.consultatingData!.temperature}°"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 18.0, right: 18, top: 5, bottom: 0),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: const Text("Rythme cardique"),
                  trailing: Text(
                      "${widget.consultatingData!.rythmecardiaque} Bts/min"),
                ),
            
              ],
            ),
          ),
        ],
      ),
    );
  }
}
