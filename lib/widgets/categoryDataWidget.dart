// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/models/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  Category cat;
  CategoryWidget({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (cat.title == "Examen") {
          Navigator.pushNamed(context, '/examen-screen');
        } else {
          Navigator.pushNamed(context, '/consulting-screen');
        } 
      },
      child: Container(
          height: ScreenUtil().setHeight(250),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: cat.title == "Rendez-vous"
                  ? AppColors.blur
                  : cat.title == "Examen"
                      ? AppColors.violet
                      : cat.title == "Consultation"
                          ? AppColors.jaune
                          : AppColors.rose,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                cat.image!,
                width: 30,
                color: Colors.black,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                cat.title!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }
}
