

class Commune {
    Commune({
        this.id,
        this.libellecommune,
        this.affichagecommune,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? libellecommune;
    String? affichagecommune;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Commune.fromJson(Map<dynamic, dynamic> json) => Commune(
        id: json["id"],
        libellecommune: json["libellecommune"],
        affichagecommune: json["affichagecommune"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "libellecommune": libellecommune,
        "affichagecommune": affichagecommune,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };


}
