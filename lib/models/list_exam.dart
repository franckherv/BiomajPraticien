import 'dart:convert';

import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/models/medecin_model.dart';
import 'package:biomaj/models/type_exam.dart';
import 'package:flutter/material.dart';

class ListExam {
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
  final TypeExam? typeExam;
  Patient? patient;
  Stat? etat;
  final String? renseignementClt;
  final int? consultationId;
  final dynamic hopitalId;
  final List<dynamic>? exament;

  ListExam({
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
    this.exament,
    this.patient,
    this.etat,
    this.typeExam,
  });

  factory ListExam.fromRawJson(String str) =>
      ListExam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListExam.fromJson(Map<String, dynamic> json) => ListExam(
        id: json["id"],
        dateanalyse: json["dateanalyse"],
        descriptionanalyse: json["descriptionanalyse"],
        biologisteId: json["biologiste_id"],
        examenmedicalId: json["examenmedical_id"],
        etatId: json["etat_id"],
        affichageanalyse: json["affichageanalyse"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        patientId: json["patient_id"],
        examendemande: json["examendemande"],
        typeExamen: json["type_examen"],
        renseignementClt: json["renseignement_clt"],
        consultationId: json["consultation_id"],
        hopitalId: json["hopital_id"],
        exament: json["exament"] == null
            ? []
            : List<dynamic>.from(json["exament"]!.map((x) => x)),
        patient:
            json["patient"] == null ? null : Patient.fromJson(json["patient"]),
        etat: json["stat"] == null ? null : Stat.fromJson(json["stat"]),
        typeExam: json["typ"] == null ? null : TypeExam.fromJson(json["typ"]),
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
        "patient": patient,
        "stat": etat,
        "typ": typeExam,
        "exament":
            exament == null ? [] : List<dynamic>.from(exament!.map((x) => x)),
      };
}

class Examencours {
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
  final Medecin? patient;
  //final Stat? stat;
  final Medecin? medecin;
  final TypeExam? typeExam;

  Examencours({
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
    this.patient,
    // this.stat,
    this.medecin,
    this.typeExam,
  });

  factory Examencours.fromRawJson(String str) =>
      Examencours.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Examencours.fromJson(Map<String, dynamic> json) => Examencours(
        id: json["id"],
        dateanalyse: json["dateanalyse"],
        descriptionanalyse: json["descriptionanalyse"],
        biologisteId: json["biologiste_id"],
        examenmedicalId: json["examenmedical_id"],
        etatId: json["etat_id"],
        affichageanalyse: json["affichageanalyse"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        patientId: json["patient_id"],
        examendemande: json["examendemande"],
        typeExamen: json["type_examen"],
        renseignementClt: json["renseignement_clt"],
        consultationId: json["consultation_id"],
        hopitalId: json["hopital_id"],
        patient:
            json["patient"] == null ? null : Medecin.fromJson(json["patient"]),
        // stat: json["stat"] == null ? null : Stat.fromJson(json["stat"]),
        medecin:
            json["medecin"] == null ? null : Medecin.fromJson(json["medecin"]),
        typeExam: json["typ"] == null ? null : TypeExam.fromJson(json["typ"]),
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
        "patient": patient?.toJson(),
        // "stat": stat?.toJson(),
        "medecin": medecin?.toJson(),
        "typ": typeExam?.toJson(),
      };

  String getStatus() {
    if (etatId == 1) {
      return "Initié";
    } else if (etatId == 2) {
      return "En cours";
    } else if (etatId == 3) {
      return "Terminé";
    }
    return "";
  }

  Color color() {
   if (etatId == 1) {
      return Colors.red;
    } else if (etatId == 2) {
      return Colors.blue;
    } else if (etatId == 3) {
      return Colors.green;
    }
      return Colors.black;
  }
}

class Stat {
  final int? id;
  final String? libelleetat;
  final String? affichageetat;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Stat({
    this.id,
    this.libelleetat,
    this.affichageetat,
    this.createdAt,
    this.updatedAt,
  });

  factory Stat.fromRawJson(String str) => Stat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        id: json["id"],
        libelleetat: json["libelleetat"],
        affichageetat: json["affichageetat"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelleetat": libelleetat,
        "affichageetat": affichageetat,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  String getStatus() {
    if (libelleetat != null) {
      return libelleetat.toString();
    } else {
      return "";
    }
  }

  Color color() {
    if (libelleetat == "Actif" || libelleetat == "actif") {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
