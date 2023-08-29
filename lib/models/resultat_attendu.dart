// To parse this JSON data, do
//
//     final resultatAttendu = resultatAttenduFromJson(jsonString);

class ResultatAttendu {
    ResultatAttendu({
        this.id,
        this.dateresultat,
        this.descriptionresultat,
        this.lienresultat,
        this.analyseId,
        this.etatId,
        this.affichageresultat,
        this.createdAt,
        this.updatedAt,
        this.usersId,
    });

    int? id;
    String? dateresultat;
    dynamic descriptionresultat;
    String? lienresultat;
    int? analyseId;
    int? etatId;
    String? affichageresultat;
    var createdAt;
    var updatedAt;
    int? usersId;

    factory ResultatAttendu.fromJson(Map<String, dynamic> json) => ResultatAttendu(
        id: json["id"],
        dateresultat: json["dateresultat"],
        descriptionresultat: json["descriptionresultat"],
        lienresultat: json["lienresultat"],
        analyseId: json["analyse_id"],
        etatId: json["etat_id"],
        affichageresultat: json["affichageresultat"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        usersId: json["users_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dateresultat": dateresultat,
        "descriptionresultat": descriptionresultat,
        "lienresultat": lienresultat,
        "analyse_id": analyseId,
        "etat_id": etatId,
        "affichageresultat": affichageresultat,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "users_id": usersId,
    };
}
