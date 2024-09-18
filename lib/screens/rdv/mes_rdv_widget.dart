// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/models/rendez_vous_model.dart';
import 'package:biomaj/screens/rdv/mes_rdv_detail.dart';
import 'package:flutter/material.dart';

class MesrendezvousVueWidget extends StatelessWidget {
  // ConsultationModel? rdvvuedata;
  RendvModel rendevouslist;

  MesrendezvousVueWidget({Key? key, required this.rendevouslist});

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
            rendevouslist.hopital?.name ?? "Vide",
          ),
          subtitle: Text(
            rendevouslist.service?.name ?? "Vide",
          ),
          trailing:
              Text(CommonVariable.ddMMYYFormat.format(rendevouslist.dateRdv)),
          onTap: () {
            Navigator.of(context).pushNamed('/mes-rendez-vous-vue-detail',
                arguments: MesrendezvousVueDetail(
                  detailrdv: rendevouslist,
                ));
          },
        ),
        /*ListTile(
          leading: Container(
             width: 20,
             height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
               // fit: BoxFit.cover,
                image: AssetImage(AppImages.rdv),)
            ),
          ),
          /*const CircleAvatar(
            radius: 10,
            backgroundColor: AppColors.appThemeColor,
            backgroundImage: AssetImage(AppImages.rdv),
          ),*/
          title: Text(
            rendevouslist.hopital?.name ?? "Vide",
            //style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            overflow: TextOverflow.ellipsis,
            //maxLines: 1,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 15,
          ),
        ),*/
      ),
    );
  }
}