import 'dart:developer';
import 'dart:io';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/models/list_exam.dart';
import 'package:biomaj/models/medecin_model.dart';
import 'package:biomaj/models/rendez_vous_model.dart';
import 'package:biomaj/models/resultat_attendu.dart';
import 'package:biomaj/models/resultat_termine.dart';
import 'package:biomaj/models/service_list.dart';
import 'package:dio/dio.dart';
import '../models/all_rdv.dart';
import '../models/hopital_model.dart';
import '../models/uploadFile.dart';
import '../models/user_model.dart';

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
    String? fcmToken,
  }) async {
    try {
      Response response = await dio.post("connexion-medecin", data: {
        "contact": contact,
        "password": password,
        "notify_token": fcmToken,
      });
      print(response.data.toString());
      return response.data;
    } catch (error, stacktrace) {
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
      String? fcmToken,
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
        "notify_token": fcmToken,
      });
      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<ListConsultingHospital>> getConsultingList() async {
    try {
      Response response = await dio.get("liste-consultation-hopital");
      log(response.toString());
      return (response.data['donne']['data'] as List)
          .map((x) => ListConsultingHospital.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<AllRdv>> getRdvList() async {
    try {
      Response response = await dio.get("liste-rdv-medecin");
      return (response.data['data']['data'] as List)
          .map((x) => AllRdv.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<ExmprMdl>> getexamenprescription() async {
    try {
      Response response = await dio.get("liste-type-examen-pour-prescription");
      log("=====> $response");
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
    String? medecinId,
  }) async {
    try {
      Response response = await dio.post("nouvelle-consultation", data: {
        "tension": tension,
        "poids": poids,
        "temperature": temperature,
        "rythmecardiaque": rythmecardiaque,
        "matriculeuser": matriculeuser,
        "medecin_id": medecinId
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
    var examendemande,
    var codeconsultation,
    var typeExamen,
    var description,
    var renseignementClt,
  }) async {
    try {
      Response response = await dio.post("examen-prescription", data: {
        "codeconsultation": codeconsultation,
        "examendemande": examendemande,
        "type_examen": typeExamen,
        "description": description,
        "renseignement_clt": renseignementClt,
      });
      
      log("======> $response <=======");
      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future createNewExam({
    var examendemande,
    var typeExamen,
    var description,
    var renseignementClt,
    //var contact,
    String? matricule
  }) async {
    try {
      Response response = await dio.post("nouveau-examen", data: {
        //  "codeconsultation": codeconsultation,

        "examendemande": examendemande,
        "type_examen": typeExamen,
        "description": description,
        "renseignement_clt": renseignementClt,
        "matricule": matricule,
       // "contact": contact,
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

      return response.data;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  // get patient info
  Future<User> getPatientInfo({required String matricule}) async {
    try {
      Response response = await dio.post("patient-infos", data: {
        "matriculeuser": matricule,
      });
      return User.fromJson(response.data['donne']);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
