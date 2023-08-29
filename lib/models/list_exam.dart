


class ListExam {
    ListExam({
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

    factory ListExam.fromJson(Map<String, dynamic> json) => ListExam(
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

// To parse this JSON data, do
//
//     final examencours = examencoursFromJson(jsonString);

class Examencours {
    Examencours({
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
    var affichageanalyse;
    var createdAt;
    var updatedAt;

    factory Examencours.fromJson(Map<dynamic, dynamic> json) => Examencours(
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

    Map<dynamic, dynamic> toJson() => {
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

