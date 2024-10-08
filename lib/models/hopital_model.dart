class Hopital {
    Hopital({
        this.id,
        this.name,
        this.logo,
        this.updatedAt,
        this.createdAt,
        this.communeId,
        this.statut,
    });

    int? id;
    String? name;
    dynamic logo;
    dynamic updatedAt;
    dynamic createdAt;
    dynamic communeId;
    var statut;

    factory Hopital.fromJson(Map<dynamic, dynamic> json) => Hopital(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        communeId: json["commune_id"],
        statut: json["statut"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "commune_id": communeId,
        "statut": statut,
    };
}
