import 'dart:convert';

import 'package:biomaj/models/hopital_model.dart';
import 'package:biomaj/models/patient_model.dart';
import 'package:flutter/material.dart';

class AllRdv {
  final int id;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? hopitalId;
  final int? serviceId;
  var dateRdv;
  final int? statut;
  final String? observation;
  final int? medecinId;
  final String? heure;
  final dynamic observationmedecin;
  final Hopital? hopital;
  final Service? service;
  final Medecin? medecin;
  final Patient? patient;

  AllRdv({
    required this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.hopitalId,
    this.serviceId,
    this.dateRdv,
    this.statut,
    this.observation,
    this.medecinId,
    this.heure,
    this.observationmedecin,
    this.hopital,
    this.service,
    this.medecin,
    this.patient,
  });

  factory AllRdv.fromRawJson(String str) => AllRdv.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllRdv.fromJson(Map<String, dynamic> json) => AllRdv(
        id: json["id"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        hopitalId: json["hopital_id"],
        serviceId: json["service_id"],
        dateRdv:
            json["date_rdv"] == null ? null : DateTime.parse(json["date_rdv"]),
        statut: json["statut"],
        observation: json["observation"],
        medecinId: json["medecin_id"],
        heure: json["heure"],
        observationmedecin: json["observationmedecin"],
        hopital:
            json["hopital"] == null ? null : Hopital.fromJson(json["hopital"]),
        service:
            json["service"] == null ? null : Service.fromJson(json["service"]),
        medecin:
            json["medecin"] == null ? null : Medecin.fromJson(json["medecin"]),
        patient:
            json["patient"] == null ? null : Patient.fromJson(json["patient"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "hopital_id": hopitalId,
        "service_id": serviceId,
        "date_rdv": dateRdv?.toIso8601String(),
        "statut": statut,
        "observation": observation,
        "medecin_id": medecinId,
        "heure": heure,
        "observationmedecin": observationmedecin,
        "hopital": hopital?.toJson(),
        "service": service?.toJson(),
        "medecin": medecin?.toJson(),
        "patient": patient?.toJson(),
      };

  Color color() {
    if (statut == 2) {
      return Colors.green.shade800;
    } else if (statut == 0) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  String statutRdv() {
    if (statut == 2) {
      return "Accepté";
    } else if (statut == 0) {
      return "Réjeté";
    } else {
      return "En attente";
    }
  }
}

class Medecin {
  final int? id;
  final int? useraddId;
  final int? userdelId;
  final int? userupdId;
  final dynamic dateadd;
  final dynamic datedel;
  final dynamic dateupd;
  final String? nomuser;
  final String? prenomuser;
  final dynamic lieunaissanceuser;
  final dynamic datenaissanceuser;
  final String? sexeuser;
  final String? lieuresidenceuser;
  final String? contact1User;
  final String? contact2User;
  final String? indicateurpays;
  final dynamic posteuser;
  final dynamic fixeuser;
  final dynamic numeropiece;
  final String? matriculeuser;
  final String? lienimageuser;
  final String? etatconnecte;
  final String? affichageuser;
  final String? connecteToken;
  final int? confirme;
  final String? username;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? civilite;
  final String? typeuser;
  final dynamic dateentree;
  final dynamic daterenouvel;
  final dynamic datesortie;
  final int? societeId;
  final dynamic assurance;
  final int? statutId;
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
  final String? notifyToken;

  Medecin({
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
    this.numeropiece,
    this.matriculeuser,
    this.lienimageuser,
    this.etatconnecte,
    this.affichageuser,
    this.connecteToken,
    this.confirme,
    this.username,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.civilite,
    this.typeuser,
    this.dateentree,
    this.daterenouvel,
    this.datesortie,
    this.societeId,
    this.assurance,
    this.statutId,
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
    this.notifyToken,
  });

  factory Medecin.fromRawJson(String str) => Medecin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Medecin.fromJson(Map<String, dynamic> json) => Medecin(
        id: json["id"],
        useraddId: json["useradd_id"],
        userdelId: json["userdel_id"],
        userupdId: json["userupd_id"],
        dateadd: json["dateadd"],
        datedel: json["datedel"],
        dateupd: json["dateupd"],
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
        numeropiece: json["numeropiece"],
        matriculeuser: json["matriculeuser"],
        lienimageuser: json["lienimageuser"],
        etatconnecte: json["etatconnecte"],
        affichageuser: json["affichageuser"],
        connecteToken: json["connecte_token"],
        confirme: json["confirme"],
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
        daterenouvel: json["daterenouvel"],
        datesortie: json["datesortie"],
        societeId: json["societe_id"],
        assurance: json["assurance"],
        statutId: json["statut_id"],
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
        notifyToken: json["notify_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "useradd_id": useraddId,
        "userdel_id": userdelId,
        "userupd_id": userupdId,
        "dateadd": dateadd,
        "datedel": datedel,
        "dateupd": dateupd,
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
        "numeropiece": numeropiece,
        "matriculeuser": matriculeuser,
        "lienimageuser": lienimageuser,
        "etatconnecte": etatconnecte,
        "affichageuser": affichageuser,
        "connecte_token": connecteToken,
        "confirme": confirme,
        "username": username,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "civilite": civilite,
        "typeuser": typeuser,
        "dateentree": dateentree,
        "daterenouvel": daterenouvel,
        "datesortie": datesortie,
        "societe_id": societeId,
        "assurance": assurance,
        "statut_id": statutId,
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
        "notify_token": notifyToken,
      };
}

class Service {
  final int? id;
  final String? name;
  final dynamic createdAt;
  final dynamic updatedAt;

  Service({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
