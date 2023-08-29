// To parse this JSON data, do
//
//     final ordonnance = ordonnanceFromJson(jsonString);

class Ordonnance {
    Ordonnance({
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
    });

    int? id;
    dynamic dateordonnance;
    String? descriptionordonnance;
    int? consultationId;
    int? etatId;
    dynamic affichageordonnance;
    var createdAt;
    var updatedAt;
    String? lien;
    int? usersId;

    factory Ordonnance.fromJson(Map<String, dynamic> json) => Ordonnance(
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
    };
}
