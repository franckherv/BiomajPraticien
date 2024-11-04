import 'dart:convert';

import 'package:flutter/material.dart';

import 'type_exam.dart';

class ListConsultingHospital {
  final int? id;
  final dynamic dateconsultation;
  final dynamic description;
  final String? tension;
  final String? poids;
  final String? temperature;
  final String? rythmecardiaque;
  final dynamic medecinId;
  final int? agentmedicalId;     
  final int? etatId;
  final int? patientId;
  final dynamic affichageconsultation;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? codeconsultation;
  final dynamic usersId;
  final dynamic hopitalId;
  List<Odornance> odornance;
  List<Analise> analise;
  final Patient? patient;


  ListConsultingHospital({
    this.id,
    this.dateconsultation,
    this.description,
    this.tension,
    this.poids,
    this.temperature,
    this.rythmecardiaque,
    this.medecinId,
    this.agentmedicalId,
    this.etatId,
    this.patientId,
    this.affichageconsultation,
    this.createdAt,
    this.updatedAt,
    this.codeconsultation,
    this.usersId,
    this.hopitalId,
    required this.odornance,
    required this.analise,
    this.patient,

  });

  factory ListConsultingHospital.fromRawJson(String str) =>
      ListConsultingHospital.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListConsultingHospital.fromJson(Map<String, dynamic> json) =>
      ListConsultingHospital(
        id: json["id"],
        dateconsultation: json["dateconsultation"],
        description: json["description"],
        tension: json["tension"],
        poids: json["poids"],
        temperature: json["temperature"],
        rythmecardiaque: json["rythmecardiaque"],
        medecinId: json["medecin_id"],
        agentmedicalId: json["agentmedical_id"],
        etatId: json["etat_id"],
        patientId: json["patient_id"],
        affichageconsultation: json["affichageconsultation"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        codeconsultation: json["codeconsultation"],
        usersId: json["users_id"],
        hopitalId: json["hopital_id"],
        odornance: json["odornance"] == null
            ? []
            : List<Odornance>.from(
                json["odornance"]!.map((x) => Odornance.fromJson(x))),
        analise: json["analise"] == null
            ? []
            : List<Analise>.from(
                json["analise"]!.map((x) => Analise.fromJson(x))),
        patient:
            json["patient"] == null ? null : Patient.fromJson(json["patient"]),
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateconsultation": dateconsultation,
        "description": description,
        "tension": tension,
        "poids": poids,
        "temperature": temperature,
        "rythmecardiaque": rythmecardiaque,
        "medecin_id": medecinId,
        "agentmedical_id": agentmedicalId,
        "etat_id": etatId,
        "patient_id": patientId,
        "affichageconsultation": affichageconsultation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "codeconsultation": codeconsultation,
        "users_id": usersId,
        "hopital_id": hopitalId,
        "odornance": odornance == null
            ? []
            : List<dynamic>.from(odornance.map((x) => x.toJson())),
        "analise": analise == null
            ? []
            : List<dynamic>.from(analise.map((x) => x.toJson())),
        "patient": patient?.toJson(),
      };


      String getStatus(){
          if (etatId == 1) {
            return "Actif";
          }
           else {
            return "Non actif";
           }
      }

        Color color(){
          if (etatId == 1) {
            return Colors.green;
          }
           else {
            return Colors.red;
           }
      }
}

class Patient {
  final int? id;
  final int? useraddId;
  final int? userdelId;
  final int? userupdId;
  final DateTime? dateadd;
  final DateTime? datedel;
  final DateTime? dateupd;
  final String? nomuser;
  final String? prenomuser;
  final dynamic lieunaissanceuser;
  final dynamic datenaissanceuser;
  final String? sexeuser;
  final dynamic lieuresidenceuser;
  final String? contact1User;
  final dynamic contact2User;
  final String? indicateurpays;
  final dynamic posteuser;
  final dynamic fixeuser;
  final String? matriculeuser;
  final String? lienimageuser;
  final String? etatconnecte;
  final String? affichageuser;
  final String? connecteToken;
  final String? username;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? civilite;
  final dynamic typeuser;
  final dynamic dateentree;
  final dynamic datesortie;
  final dynamic assurance;
  final String? cmu;
  final String? profession;
  final String? secteurActivite;
  final dynamic secteurActive;
  final String? personneUrgeencChirug;
  final String? personneUrgence;
  final String? allergie;
  final String? allergieName;
  final String? asthme;
  final String? diabete;
  final String? maladieCoeur;
  final String? epilepsie;
  final String? hypertensionArterielle;
  final String? autreMaladie;
  final String? groupeSanguin;
  final String? tensionArterielle;
  final String? statutElectrophoretique;
  final dynamic communeId;

  Patient({
    this.id,
    this.useraddId,
    this.userdelId,
    this.userupdId,
    this.dateadd,
    this.datedel,
    this.dateupd,
    this.nomuser,
    this.prenomuser,
    this.lieunaissanceuser,
    this.datenaissanceuser,
    this.sexeuser,
    this.lieuresidenceuser,
    this.contact1User,
    this.contact2User,
    this.indicateurpays,
    this.posteuser,
    this.fixeuser,
    this.matriculeuser,
    this.lienimageuser,
    this.etatconnecte,
    this.affichageuser,
    this.connecteToken,
    this.username,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.civilite,
    this.typeuser,
    this.dateentree,
    this.datesortie,
    this.assurance,
    this.cmu,
    this.profession,
    this.secteurActivite,
    this.secteurActive,
    this.personneUrgeencChirug,
    this.personneUrgence,
    this.allergie,
    this.allergieName,
    this.asthme,
    this.diabete,
    this.maladieCoeur,
    this.epilepsie,
    this.hypertensionArterielle,
    this.autreMaladie,
    this.groupeSanguin,
    this.tensionArterielle,
    this.statutElectrophoretique,
    this.communeId,
  });

  factory Patient.fromRawJson(String str) => Patient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        useraddId: json["useradd_id"],
        userdelId: json["userdel_id"],
        userupdId: json["userupd_id"],
        dateadd:
            json["dateadd"] == null ? null : DateTime.parse(json["dateadd"]),
        datedel:
            json["datedel"] == null ? null : DateTime.parse(json["datedel"]),
        dateupd:
            json["dateupd"] == null ? null : DateTime.parse(json["dateupd"]),
        nomuser: json["nomuser"],
        prenomuser: json["prenomuser"],
        lieunaissanceuser: json["lieunaissanceuser"],
        datenaissanceuser: json["datenaissanceuser"],
        sexeuser: json["sexeuser"],
        lieuresidenceuser: json["lieuresidenceuser"],
        contact1User: json["contact1user"],
        contact2User: json["contact2user"],
        indicateurpays: json["indicateurpays"],
        posteuser: json["posteuser"],
        fixeuser: json["fixeuser"],
        matriculeuser: json["matriculeuser"],
        lienimageuser: json["lienimageuser"],
        etatconnecte: json["etatconnecte"],
        affichageuser: json["affichageuser"],
        connecteToken: json["connecte_token"],
        username: json["username"],
        email: json["email"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        civilite: json["civilite"],
        typeuser: json["typeuser"],
        dateentree: json["dateentree"],
        datesortie: json["datesortie"],
        assurance: json["assurance"],
        cmu: json["cmu"],
        profession: json["profession"],
        secteurActivite: json["secteur_activite"],
        secteurActive: json["secteur_active"],
        personneUrgeencChirug: json["personne_urgeenc_chirug"],
        personneUrgence: json["personne_urgence"],
        allergie: json["allergie"],
        allergieName: json["allergie_name"],
        asthme: json["asthme"],
        diabete: json["diabete"],
        maladieCoeur: json["maladie_coeur"],
        epilepsie: json["epilepsie"],
        hypertensionArterielle: json["hypertension_arterielle"],
        autreMaladie: json["autre_maladie"],
        groupeSanguin: json["groupe_sanguin"],
        tensionArterielle: json["tension_arterielle"],
        statutElectrophoretique: json["statut_electrophoretique"],
        communeId: json["commune_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "useradd_id": useraddId,
        "userdel_id": userdelId,
        "userupd_id": userupdId,
        "dateadd": dateadd?.toIso8601String(),
        "datedel": datedel?.toIso8601String(),
        "dateupd": dateupd?.toIso8601String(),
        "nomuser": nomuser,
        "prenomuser": prenomuser,
        "lieunaissanceuser": lieunaissanceuser,
        "datenaissanceuser": datenaissanceuser,
        "sexeuser": sexeuser,
        "lieuresidenceuser": lieuresidenceuser,
        "contact1user": contact1User,
        "contact2user": contact2User,
        "indicateurpays": indicateurpays,
        "posteuser": posteuser,
        "fixeuser": fixeuser,
        "matriculeuser": matriculeuser,
        "lienimageuser": lienimageuser,
        "etatconnecte": etatconnecte,
        "affichageuser": affichageuser,
        "connecte_token": connecteToken,
        "username": username,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "civilite": civilite,
        "typeuser": typeuser,
        "dateentree": dateentree,
        "datesortie": datesortie,
        "assurance": assurance,
        "cmu": cmu,
        "profession": profession,
        "secteur_activite": secteurActivite,
        "secteur_active": secteurActive,
        "personne_urgeenc_chirug": personneUrgeencChirug,
        "personne_urgence": personneUrgence,
        "allergie": allergie,
        "allergie_name": allergieName,
        "asthme": asthme,
        "diabete": diabete,
        "maladie_coeur": maladieCoeur,
        "epilepsie": epilepsie,
        "hypertension_arterielle": hypertensionArterielle,
        "autre_maladie": autreMaladie,
        "groupe_sanguin": groupeSanguin,
        "tension_arterielle": tensionArterielle,
        "statut_electrophoretique": statutElectrophoretique,
        "commune_id": communeId,
      };
}


class Analise {
    final int? id;
    final dynamic dateanalyse;
    final String? descriptionanalyse;
    final int? biologisteId;
    final dynamic examenmedicalId;
    final int? etatId;
    final dynamic affichageanalyse;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? patientId;
    final String? examendemande;
    final String? typeExamen;
    final String? renseignementClt;
    final int? consultationId;
    final dynamic hopitalId;
    final TypeExam? typeExam;

    Analise({
        this.id,
        this.dateanalyse,
        this.descriptionanalyse,
        this.biologisteId,
        this.examenmedicalId,
        this.etatId,
        this.affichageanalyse,
        this.createdAt,
        this.updatedAt,
        this.patientId,
        this.examendemande,
        this.typeExamen,
        this.renseignementClt,
        this.consultationId,
        this.hopitalId,
        this.typeExam,
    });

    factory Analise.fromRawJson(String str) => Analise.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Analise.fromJson(Map<String, dynamic> json) => Analise(
        id: json["id"],
        dateanalyse: json["dateanalyse"],
        descriptionanalyse: json["descriptionanalyse"],
        biologisteId: json["biologiste_id"],
        examenmedicalId: json["examenmedical_id"],
        etatId: json["etat_id"],
        affichageanalyse: json["affichageanalyse"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        patientId: json["patient_id"],
        examendemande: json["examendemande"],
        typeExamen: json["type_examen"],
        renseignementClt: json["renseignement_clt"],
        consultationId: json["consultation_id"],
        hopitalId: json["hopital_id"],

             typeExam:
            json["typ"] == null ? null : TypeExam.fromJson(json["typ"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dateanalyse": dateanalyse,
        "descriptionanalyse": descriptionanalyse,
        "biologiste_id": biologisteId,
        "examenmedical_id": examenmedicalId,
        "etat_id": etatId,
        "affichageanalyse": affichageanalyse,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "patient_id": patientId,
        "examendemande": examendemande,
        "type_examen": typeExamen,
        "renseignement_clt": renseignementClt,
        "consultation_id": consultationId,
        "hopital_id": hopitalId,
         "typ": typeExam?.toJson(),

    };
}


class Odornance {
  Odornance({
    this.id,
    this.dateordonnance,
    this.descriptionordonnance,
    this.consultationId,
    this.etatId,
    this.affichageordonnance,
    this.createdAt,
    this.updatedAt,
    this.lien,
    this.usersId,
    this.medecinId,
  });

  int? id;
  dynamic dateordonnance;
  String? descriptionordonnance;
  int? consultationId;
  int? etatId;
  dynamic affichageordonnance;
  String? createdAt;
  String? updatedAt;
  dynamic lien;
  dynamic usersId;
  int? medecinId;

  factory Odornance.fromJson(Map<String, dynamic> json) => Odornance(
        id: json["id"],
        dateordonnance: json["dateordonnance"],
        descriptionordonnance: json["descriptionordonnance"],
        consultationId: json["consultation_id"],
        etatId: json["etat_id"],
        affichageordonnance: json["affichageordonnance"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        lien: json["lien"],
        usersId: json["users_id"],
      //  medecinId: json["medecin_id"] != null ? json["medecin_id"] : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateordonnance": dateordonnance,
        "descriptionordonnance": descriptionordonnance,
        "consultation_id": consultationId,
        "etat_id": etatId,
        "affichageordonnance": affichageordonnance,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "lien": lien,
        "users_id": usersId,
       // "medecin_id": medecinId,
      };
}

class ModelAnalyse {
  ModelAnalyse({
    this.id,
    this.dateanalyse,
    this.descriptionanalyse,
    this.biologisteId,
    this.examenmedicalId,
    this.etatId,
    this.consultationId,
    this.hopitalId,
    this.affichageanalyse,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  dynamic dateanalyse;
  String? descriptionanalyse;
  int? biologisteId;
  int? examenmedicalId;
  int? etatId;
  int? consultationId;
  int? hopitalId;
  String? affichageanalyse;
  var createdAt;
  String? updatedAt;

  factory ModelAnalyse.fromJson(Map<String, dynamic> json) => ModelAnalyse(
        id: json["id"],
        dateanalyse: json["dateanalyse"],
        descriptionanalyse: json["descriptionanalyse"],
        biologisteId: json["biologiste_id"],
        examenmedicalId: json["examenmedical_id"],
        etatId: json["etat_id"],
        consultationId: json["consultation_id"],
        hopitalId: json["hopital_id"],
        affichageanalyse: json["affichageanalyse"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateanalyse": dateanalyse,
        "descriptionanalyse": descriptionanalyse,
        "biologiste_id": biologisteId,
        "examenmedical_id": examenmedicalId,
        "etat_id": etatId,
        "consultation_id": consultationId,
        "hopital_id": hopitalId,
        "affichageanalyse": affichageanalyse,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class ExmprMdl {
  ExmprMdl({
    this.id,
    this.libelletypeexamen,
    this.descriptiontypeexamen,
    this.affichagetypeexamen,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  var libelletypeexamen;
  dynamic descriptiontypeexamen;
  String? affichagetypeexamen;
  String? createdAt;
  String? updatedAt;

  factory ExmprMdl.fromJson(Map<String, dynamic> json) => ExmprMdl(
        id: json["id"],
        libelletypeexamen: json["libelletypeexamen"],
        descriptiontypeexamen: json["descriptiontypeexamen"],
        affichagetypeexamen: json["affichagetypeexamen"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelletypeexamen": libelletypeexamen,
        "descriptiontypeexamen": descriptiontypeexamen,
        "affichagetypeexamen": affichagetypeexamen,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Prescription {
  Prescription({
    this.id,
    this.dateexamenmedical,
    this.descriptionexam,
    this.consultationId,
    this.etatId,
    this.affichageexamenmedial,
    this.createdAt,
    this.updatedAt,
    this.typeexamenId,
  });

  int? id;
  dynamic dateexamenmedical;
  var descriptionexam;
  int? consultationId;
  int? etatId;
  String? affichageexamenmedial;
  String? createdAt;
  String? updatedAt;
  int? typeexamenId;

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        id: json["id"],
        dateexamenmedical: json["dateexamenmedical"],
        descriptionexam: json["descriptionexam"],
        consultationId: json["consultation_id"],
        etatId: json["etat_id"],
        affichageexamenmedial: json["affichageexamenmedial"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        typeexamenId: json["typeexamen_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateexamenmedical": dateexamenmedical,
        "descriptionexam": descriptionexam,
        "consultation_id": consultationId,
        "etat_id": etatId,
        "affichageexamenmedial": affichageexamenmedial,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "typeexamen_id": typeexamenId,
      };
}

class ModelOrdonnance {
  ModelOrdonnance({
    this.id,
    this.dateordonnance,
    this.descriptionordonnance,
    this.consultationId,
    this.etatId,
    this.affichageordonnance,
    this.createdAt,
    this.updatedAt,
    this.lien,
    this.usersId,
    this.medecinId,
  });

  int? id;
  dynamic dateordonnance;
  String? descriptionordonnance;
  int? consultationId;
  int? etatId;
  dynamic affichageordonnance;
  String? createdAt;
  String? updatedAt;
  dynamic lien;
  dynamic usersId;
  int? medecinId;

  factory ModelOrdonnance.fromJson(Map<String, dynamic> json) =>
      ModelOrdonnance(
        id: json["id"],
        dateordonnance: json["dateordonnance"],
        descriptionordonnance: json["descriptionordonnance"],
        consultationId: json["consultation_id"],
        etatId: json["etat_id"],
        affichageordonnance: json["affichageordonnance"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        lien: json["lien"],
        usersId: json["users_id"],
        medecinId: json["medecin_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateordonnance": dateordonnance,
        "descriptionordonnance": descriptionordonnance,
        "consultation_id": consultationId,
        "etat_id": etatId,
        "affichageordonnance": affichageordonnance,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "lien": lien,
        "users_id": usersId,
        "medecin_id": medecinId,
      };
}
