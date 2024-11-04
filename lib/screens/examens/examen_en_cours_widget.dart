// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/models/list_exam.dart';
import 'package:biomaj/screens/examens/detail_encours_screen.dart';
import 'package:flutter/material.dart';

class ExamenEncoursWidget extends StatelessWidget {
  
  Examencours examEncours;

  ExamenEncoursWidget({super.key, required this.examEncours});

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
                  image: AssetImage(AppImages.analyseIcon),
                )),
          ),
          title: Text(
            examEncours.typeExam!.libelletypeexamen ?? "Vide",
              overflow: TextOverflow.ellipsis,

          ),
          subtitle:  examEncours.patient != null?  Text(
                examEncours.patient!.nomuser.toString(),
                  overflow: TextOverflow.ellipsis,
              ) : const SizedBox.shrink(),
        
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(CommonVariable.ddMMYYFormat.format(DateTime.parse(examEncours.createdAt.toString()))),
             
              Text(examEncours.getStatus(), style: TextStyle(color: examEncours.color()),),
            ],
          ),
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
