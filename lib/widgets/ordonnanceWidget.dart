// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/models/ordonnance.dart';
import 'package:flutter/material.dart';

class OrdonnanceWidget extends StatelessWidget {
  Ordonnance? ordonnance;
  int? index;
  OrdonnanceWidget({Key? key, this.ordonnance, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
    
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: ordonnance!.descriptionordonnance != null
              ? Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: ListTile(
                    leading: Image.asset(
                      AppImages.pdf,
                      width: 25,
                    ),
                    title: Text("Ordonnance   0${index! + 1}"),
                    // Text(
                    subtitle: Text(ordonnance!.lien.toString()),

                    trailing: ordonnance!.dateordonnance != null ? Text(ordonnance!.dateordonnance.toString()): const Text(""),
                  ),
                  margin: const EdgeInsets.all(0.0),
                )
              : Container(),
        ),
      ),
    );
  }
}
