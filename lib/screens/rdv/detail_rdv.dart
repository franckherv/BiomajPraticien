// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/models/all_rdv.dart';
import 'package:flutter/material.dart';

class RdvDataWidget extends StatelessWidget {
  AllRdv allRdv;
  int index;
  RdvDataWidget(
      {Key? key, required this.allRdv, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       /* Navigator.of(context).pushNamed('/consulting-detail-screen',
            arguments: ConsultingDetailScreen(
              detailCsltn: allRdv,
            )); */
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
          child: SizedBox(
              child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image.asset(
                AppImages.rdv,
                width: 25,
              ),
              title: Text(
                  "${allRdv.patient!.nomuser} ${allRdv.patient!.prenomuser}"),
              trailing: allRdv.createdAt != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(CommonVariable.ddMMYYFormat.format(
                            DateTime.parse(allRdv.createdAt.toString()))),
                        // Text(
                        //   allRdv.stat!.libelleetat.toString(),
                        //   style: TextStyle(color: allRdv.stat!.color(), fontWeight: FontWeight.bold),
                        // ),
                      ],
                    )
                  : const SizedBox.shrink(),

             
            ),
            margin: const EdgeInsets.all(0.0),
          )),
        ),
      ),
    );
  }
}
