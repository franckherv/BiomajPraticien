// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/models/list_exam.dart';
import 'package:biomaj/screens/examens/detail_encours_screen.dart';
import 'package:flutter/material.dart';

class ExamenEncoursWidget extends StatelessWidget {
  
  Examencours examEncours;

  ExamenEncoursWidget({Key? key, required this.examEncours});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
        //  height: ScreenUtil().setHeight(40),
        child: ListTile(
          leading: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // fit: BoxFit.cover,
                  image: AssetImage(AppImages.rdv),
                )),
          ),
          title: Text(
            examEncours.descriptionanalyse ?? "Vide",
              overflow: TextOverflow.ellipsis,

          ),
          // subtitle: Text(
          //   rendevouslist.service?.name ?? "Vide",
          // ),
          trailing: Text(CommonVariable.ddMMYYFormat.format(DateTime.parse(examEncours.createdAt))),
          onTap: () {
            Navigator.of(context).pushNamed('/Detail-examen-encours-screen',
                arguments: DetailExamenencoursScreen( 
                  examencours: examEncours,
                ));
          },
        ), 
    
      ),
    );
  }
}
