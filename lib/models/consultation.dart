

/*class ListConsultingHospital {
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
    });

    int? id;
    dynamic dateconsultation;
    String? description;
    String? tension;
    String? poids;
    String? temperature;
    String? rythmecardiaque;
    int? medecinId;
    int? agentmedicalId;
    int? etatId;
    int? patientId;
    dynamic affichageconsultation;
    String? createdAt;
    String? updatedAt;
    String? codeconsultation;
    dynamic usersId;
    int? hopitalId;

    factory ListConsultingHospital.fromJson(Map<dynamic, dynamic> json) => ListConsultingHospital(
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
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        codeconsultation: json["codeconsultation"],
        usersId: json["users_id"],
        hopitalId: json["hopital_id"],
    );

    Map<dynamic, dynamic> toJson() => {
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "codeconsultation": codeconsultation,
        "users_id": usersId,
        "hopital_id": hopitalId,
    };
} */

// To parse this JSON data, do
//
//     final listConsultingHospital = listConsultingHospitalFromJson(jsonString);

import 'dart:convert';

ListConsultingHospital listConsultingHospitalFromJson(String str) => ListConsultingHospital.fromJson(json.decode(str));

String listConsultingHospitalToJson(ListConsultingHospital data) => json.encode(data.toJson());

class ListConsultingHospital {
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
    });

    int? id;
    dynamic dateconsultation;
    String? description;
    String? tension;
    String? poids;
    String? temperature;
    String? rythmecardiaque;
    int? medecinId;
    int? agentmedicalId;
    int? etatId;
    int? patientId;
    dynamic affichageconsultation;
    String? createdAt;
    String? updatedAt;
    String? codeconsultation;
    dynamic usersId;
    int? hopitalId;
    List<Odornance> odornance;
    List<Analise> analise;

    factory ListConsultingHospital.fromJson(Map<String, dynamic> json) => ListConsultingHospital(
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
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        codeconsultation: json["codeconsultation"],
        usersId: json["users_id"],
        hopitalId: json["hopital_id"],
        odornance: json["odornance"] == null ? [] : List<Odornance>.from(json["odornance"]!.map((x) => Odornance.fromJson(x))),
        analise: json["analise"] == null ? [] : List<Analise>.from(json["analise"]!.map((x) => Analise.fromJson(x))),
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "codeconsultation": codeconsultation,
        "users_id": usersId,
        "hopital_id": hopitalId,
        "odornance":  List<dynamic>.from(odornance.map((x) => x.toJson())),
        "analise": List<dynamic>.from(analise.map((x) => x.toJson())),
    };
}

class Analise {
    Analise({
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
    dynamic biologisteId;
    int? examenmedicalId;
    int? etatId;
    int? consultationId;
    dynamic hopitalId;
    dynamic affichageanalyse;
    String? createdAt;
    String? updatedAt;

    factory Analise.fromJson(Map<String, dynamic> json) => Analise(
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

    factory ModelOrdonnance.fromJson(Map<String, dynamic> json) => ModelOrdonnance(
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



