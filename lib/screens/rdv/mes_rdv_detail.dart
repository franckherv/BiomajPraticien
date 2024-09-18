// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/models/rendez_vous_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MesrendezvousVueDetail extends StatefulWidget {
  RendvModel detailrdv;
  MesrendezvousVueDetail({required this.detailrdv});

  @override
  State<MesrendezvousVueDetail> createState() => _MesrendezvousVueDetailState();
}

class _MesrendezvousVueDetailState extends State<MesrendezvousVueDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarmenu(
          context: context,
          title: "Détail du rendez-vous",
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
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setHeight(15),
              vertical: ScreenUtil().setHeight(10)),
          child: ListView(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              const Text(
                "Vous avez pris un rendez-vous pour \n une consultation.",
                style: AppDesign.bienvenu,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(25),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Horaires",
                          style: AppDesign.messervice,
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // margin: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'Date',
                            ),
                            trailing: Text(CommonVariable.ddMMYYFormat
                                .format(widget.detailrdv.dateRdv)),
                          ),
                          ListTile(
                            title: const Text(
                              'Heure de rendez-vous',
                            ),
                            trailing: Text(CommonVariable.hhMMFormat
                                .format(widget.detailrdv.createdAt)),
                          ),
                          ListTile(
                              title: const Text(
                                'Statut',
                              ),
                              trailing: Chip(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: -5, horizontal: 5),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  )),
                                  backgroundColor: Colors.blue,
                                  label: widget.detailrdv.statut == 1
                                      ? const Text(
                                          "En attente",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      : widget.detailrdv.statut == 0
                                          ? const Text(
                                              "Réjeté",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          : const Text(
                                              "Validé",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ))),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Note du rendez-vous",
                          style: AppDesign.messervice,
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // margin: EdgeInsets.all(2widget.detailrdv.id
                      child: widget.detailrdv.observation != null
                          ? Column(
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(20),
                                  title: Text(
                                    "${widget.detailrdv.observation}",
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(
                              width: double.infinity,
                              height: ScreenUtil().setHeight(100),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [Text("Pas de note")],
                              ),
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}