

import 'package:biomaj/models/category_list.dart';
import 'package:biomaj/models/date_model.dart';
import 'package:biomaj/models/hospital_model.dart';
import 'package:biomaj/models/hourModel.dart';
import 'package:biomaj/models/ordonnance_model.dart';
import 'package:biomaj/models/pub_list.dart';
import 'package:biomaj/models/service_list.dart';

import '../models/rdv_stat_model.dart';
import 'fake_data.dart';

class ApiServiceSimulation {

  /*===================Do never remove these datas============================================*/

  // List<OperateurModel> getOperateursList({bool fake: false}) {
  //   if (fake) {
  //     return operateursList().map((e) => OperateurModel.fromJson(e)).toList();
  //   }
  //   return [];
  // }

  /*===================Do never remove these datas============================================*/





  List<Pub> getpubList({bool fake = false}) {
    if (fake) {
      return pubList().map((e) => Pub.fromJson(e)).toList();
    }
    return [];
  }


  List<Category> getcategoryList({bool fake = false}) {
    if (fake) {
      return categoryList().map((e) => Category.fromJson(e)).toList();
    }
    return [];
  }


  List<medecinModel> getmedcinList({bool fake = false}) {
    if (fake) {
      return medecinList().map((e) => medecinModel.fromJson(e)).toList();
    }
    return [];
  }

    List<ServiceModel> getserviceList({bool fake = false}) {
    if (fake) {
      return serviceList().map((e) => ServiceModel.fromJson(e)).toList();
    }
    return [];
  }


  List<DateModel> getdatelist({bool fake = false}) {
    if (fake) {
      return dayList().map((e) => DateModel.fromJson(e)).toList();
    }
    return [];
  }  
    List<MatModel> getmatlist({bool fake = false}) {
    if (fake) {
      return matinList().map((e) => MatModel.fromJson(e)).toList();
    }
    return [];
  }  
    List<SoirModel> getsoirlist({bool fake = false}) {
    if (fake) {
      return soirList().map((e) => SoirModel.fromJson(e)).toList();
    }
    return [];
  }  

      List<RdvStatusModel> statustList({bool fake = false}) {
    if (fake) {
      return rdvStatutList().map((e) => RdvStatusModel.fromJson(e)).toList();
    }
    return [];
  } 



       List<OrdonnanceModel> getOrdonnanceList({bool fake = false}) {
    if (fake) {
      return ordonnanceList().map((e) => OrdonnanceModel.fromJson(e)).toList();
    }
    return [];
  } 
     


     


}


