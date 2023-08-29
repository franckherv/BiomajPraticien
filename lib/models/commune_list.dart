

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
        id: json["id"] == null ? null : json["id"],
        libellecommune: json["libellecommune"] == null ? null : json["libellecommune"],
        affichagecommune: json["affichagecommune"] == null ? null : json["affichagecommune"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id == null ? null : id,
        "libellecommune": libellecommune == null ? null : libellecommune,
        "affichagecommune": affichagecommune == null ? null : affichagecommune,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };


}
