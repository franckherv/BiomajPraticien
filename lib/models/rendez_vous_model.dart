
class RendvModel {
    RendvModel({
        this.id,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.hopitalId,
        this.serviceId,
        this.dateRdv,
        this.statut,
        this.observation,
        this.hopital,
        this.service,
    });

    int? id;
    dynamic userId;
    var createdAt;
    DateTime? updatedAt;
    int? hopitalId;
    int? serviceId;
    var dateRdv;
    int? statut;
    dynamic observation;
    Hopitall? hopital;
    Services? service;

    factory RendvModel.fromJson(Map<String, dynamic> json) => RendvModel(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        hopitalId: json["hopital_id"] == null ? null : json["hopital_id"],
        serviceId: json["service_id"] == null ? null : json["service_id"],
        dateRdv: json["date_rdv"] == null ? null : DateTime.parse(json["date_rdv"]),
        statut: json["statut"] == null ? null : json["statut"],
        observation: json["observation"],
        hopital: json["hopital"] == null ? null : Hopitall.fromJson(json["hopital"]),
        service: json["service"] == null ? null : Services.fromJson(json["service"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "hopital_id": hopitalId == null ? null : hopitalId,
        "service_id": serviceId == null ? null : serviceId,
        "date_rdv": dateRdv == null ? null : dateRdv!.toIso8601String(),
        "statut": statut == null ? null : statut,
        "observation": observation,
        "hopital": hopital == null ? null : hopital!.toJson(),
        "service": service == null ? null : service!.toJson(),
    };
}

class Hopitall {
    Hopitall({
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
    int? statut;

    factory Hopitall.fromJson(Map<String, dynamic> json) => Hopitall(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        logo: json["logo"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        communeId: json["commune_id"],
        statut: json["statut"] == null ? null : json["statut"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "logo": logo,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "commune_id": communeId,
        "statut": statut == null ? null : statut,
    };
}

class Services {
    Services({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    dynamic createdAt;
    dynamic updatedAt;

    factory Services.fromJson(Map<String, dynamic> json) => Services(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
