import 'dart:io';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/models/hopital_model.dart';
import 'package:biomaj/models/list_exam.dart';
import 'package:biomaj/models/medecin_model.dart';
import 'package:biomaj/models/rendez_vous_model.dart';
import 'package:biomaj/models/resultat_attendu.dart';
import 'package:biomaj/models/resultat_termine.dart';
import 'package:biomaj/models/service_list.dart';
import 'package:dio/dio.dart';

import '../models/uploadFile.dart';

class HttpGlobalDatasource {
  Dio dio = Dio(
    BaseOptions(baseUrl: CommonVariable.apiBaseUrl, headers: {
      "Accept": "application/json",
      "Authorization": 'Bearer ${CommonVariable.userTken}'
    }),
  );
  var token;

  //Connexion

  Future connexion({
    String? contact,
    String? password,
  }) async {
    try {
      Response response = await dio.post("connexion-medecin", data: {
        "contact": contact,
        "password": password,
      });
      print("Connexion ===========$response==========");
      return response.data;
    } catch (error, stacktrace) {
      print("========error=====$error=================");
      print("========stacktrace=====$stacktrace===============");
    }
  }

  Future logout() async {
    try {
      Response response = await dio.post("logout");
      return response.data;
    } catch (error, stacktrace) {
      print("###error logout####${error}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  //Inscription Etape 1
  Future signupUser(
      {String? contact,
      String? password,
      String? name,
      String? lastname,
      String? communeId,
      String? confirmPassword,
      var sexeuser}) async {
    try {
      Response response = await dio.post('inscription', data: {
        "contact": contact,
        "password": password,
        "name": name,
        "lastname": lastname,
        "commune_id": communeId,
        "confirm_password": confirmPassword,
        "sexeuser": sexeuser,
      });
      return response.data;
    } catch (error, stacktrace) {
      print("###error signupStep1WithEmailDataSource####${error}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<ListConsultingHospital>> getConsultingList() async {
    try {
      Response response = await dio.get("liste-consultation-hopital");
      print("###response####${response.data['donne']}###");

      return (response.data['donne']['data'] as List)
          .map((x) => ListConsultingHospital.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<ExmprMdl>> getexamenprescription() async {
    try {
      Response response = await dio.get("liste-type-examen-pour-prescription");

      return (response.data['donne'] as List)
          .map((x) => ExmprMdl.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<Hopital>> getHospital() async {
    try {
      Response response = await dio.get("liste-hopital");
      print("###response####${response.data['donne']}###");

      // return ClientHomeData.fromJson(response.data['donne']['metier']);

      return (response.data['donne'] as List)
          .map((x) => Hopital.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<ServiceData>> getService({String? hopitalId}) async {
    try {
      Response response = await dio
          .post("liste-service-hopital", data: {"hopital_id": hopitalId});
      print("###response####${response.data['donne']}###");

      return (response.data['donne'] as List)
          .map((x) => ServiceData.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<RendvModel>> getrdvList() async {
    try {
      Response response = await dio.get("liste-rdv");
      print("###response####${response.data['donne']}###");

      return (response.data['donne'] as List)
          .map((x) => RendvModel.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<ResultatTermine>> resultEndList() async {
    try {
      Response response = await dio.get("resultat-terminer");
      print("###response####${response.data}###");

      return (response.data['donne'] as List)
          .map((x) => ResultatTermine.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<ResultatAttendu>> resulAttenduList() async {
    try {
      Response response = await dio.get("resultat-attend");
      print("###response####${response.data}###");

      return (response.data['donne'] as List)
          .map((x) => ResultatAttendu.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<MedecinModel>> getDoctorList(
      {String? hopitalId, String? serviceId}) async {
    try {
      Response response = await dio.post("liste-medecin-hopital", data: {
        "hopital_id": hopitalId,
        "service_id": serviceId,
      });
      print("###response####${response.data['donne']}###");

      return (response.data['donne'] as List)
          .map((x) => MedecinModel.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<Prescription>> getprescription({String? id}) async {
    try {
      Response response =
          await dio.post("liste-examen-pour-prescription", data: {"id": id});
      print(
          "======Sous groupe liste${response.data['donne']}=================");

      return (response.data['donne'] as List)
          .map((x) => Prescription.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<ListExam>> examenList({String? code}) async {
    try {
      Response response = await dio.post("get-examen-by-code", data: {
        "code": code,
      });
      print("###response####${response.data['data']}###");

      return (response.data['data'] as List)
          .map((x) => ListExam.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<Examencours>> getexamenEncour() async {
    try {
      Response response = await dio.get("list-examens-encours");
      print("###response####${response.data['data']['data']}###");

      return (response.data['data']['data'] as List)
          .map((x) => Examencours.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      print("========> ${error} ==========> ${stacktrace}");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future createConsultation({
    String? tension,
    String? poids,
    String? temperature,
    String? rythmecardiaque,
    String? matriculeuser,
  }) async {
    try {
      Response response = await dio.post("nouvelle-consultation", data: {
        "tension": tension,
        "poids": poids,
        "temperature": temperature,
        "rythmecardiaque": rythmecardiaque,
        "matriculeuser": matriculeuser
      });

      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future createObservation({
    String? description,
    String? codeconsultation,
  }) async {
    try {
      Response response =
          await dio.post("observation-d-une-consultation", data: {
        "description": description,
        "codeconsultation": codeconsultation,
      });
      print("RESPONSE DATA ======> $response");
      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future validateAnalyse({
    var id,
    var statut,
  }) async {
    try {
      Response response = await dio
          .post("change-examen-statut", data: {"id": id, "statut": statut});

      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
// TODO SAVE FULL IMAGE
/*  Future saveAnalyse({
    var id,
    var statut,
    //File? fichier,
    required List<Io.File> fichier,
  }) async {
    try {
      final formData = FormData.fromMap({"id": id, "statut": statut, "fichier": fichier});

      int index = 0;

      fichier.forEach((element) {
        if (index == 0) {
          formData.files.add(
              MapEntry("fichier", MultipartFile.fromFileSync(element.path)));
        } else {
          formData.files.add(MapEntry(
              "${index}", MultipartFile.fromFileSync(element.path)));
        }
     print(">>>>>>>> $fichier");
        index++;
      });

      Response response = await dio.post('save-examen-fil', data: formData);
      print("======> $response <=======");
      return response.data;
    } catch (error, stacktrace) {
      print("###error send-single-sms####${error}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  } */

//TODO SAVE ONLY IMAGE
  Future<UploadFile> saveAnalyse({
    var id,
    var statut,
    File? fichier,
  }) async {
    try {
      final formData = FormData.fromMap({"id": id, "statut": statut}..addAll({
          'fichier': fichier == null
              ? null
              : await MultipartFile.fromFile(fichier.path),
        }));
      Response response = await dio.post('save-examen-fil', data: formData);
      print("======> $response <=======");
      return UploadFile.fromJson(response.data);
    } catch (error, stacktrace) {
      print("###error send-single-sms####${error}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

//? get all images
  Future<UploadFile> getImage({
    int? id,
  }) async {
    try {
      Response response = await dio.post('image-examen', data: {
        "id": id,
      });
      print("======> $response <=======");
      return UploadFile.fromJson(response.data);
    } catch (error, stacktrace) {
      print("###error send-single-sms####${error}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future createExam({
    var name,
    var codeconsultation,
    // var examenId
  }) async {
    try {
      Response response = await dio.post("examen-prescription", data: {
        "name": name,
        "codeconsultation": codeconsultation,
        // "examen_id": examenId
      });
      print("======> $response <=======");

      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future createNewExam({
    var name,
    var contact,
  }) async {
    try {
      Response response = await dio.post("nouveau-examen", data: {
        "name": name,
        "contact": contact,
      });
      print("======> $response <=======");

      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future supprimerExam({var analyseId}) async {
    try {
      Response response = await dio.post("delete-examen", data: {
        "id_analyse": analyseId,
      });
      print("ooooooooooooooooooo $response oooooooooooooooooooo");
      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future supprimerOrdonnance({var ordonnanceId}) async {
    try {
      Response response = await dio.post("delete-ordornance", data: {
        "id_ordornance": ordonnanceId,
      });
      print("ooooooooooooooooooo $response oooooooooooooooooooo");
      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future createOrdonnance({
    String? description,
    String? codeconsultation,
  }) async {
    try {
      Response response = await dio.post("ordonnance-prescription", data: {
        "description": description,
        "codeconsultation": codeconsultation,
      });
      print("=================${response.data}===============");

      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
