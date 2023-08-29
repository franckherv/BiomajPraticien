class ServiceModel {
    ServiceModel({
        this.id,
        this.name,
    });

    int? id;
    String? name;

    factory ServiceModel.fromJson(Map<dynamic, dynamic> json) => ServiceModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
    };
}



// To parse this JSON data, do


class ServiceData {
    ServiceData({
        this.id,
        this.hopitalId,
        this.serviceId,
        this.updatedAt,
        this.createdAt,
        this.service,
    });

    int? id;
    int? hopitalId;
    int? serviceId;
    dynamic updatedAt;
    dynamic createdAt;
    ServiceU? service;

    factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        id: json["id"] == null ? null : json["id"],
        hopitalId: json["hopital_id"] == null ? null : json["hopital_id"],
        serviceId: json["service_id"] == null ? null : json["service_id"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        service: json["service"] == null ? null : ServiceU.fromJson(json["service"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "hopital_id": hopitalId == null ? null : hopitalId,
        "service_id": serviceId == null ? null : serviceId,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "service": service == null ? null : service!.toJson(),
    };
}

class ServiceU {
    ServiceU({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    dynamic createdAt;
    dynamic updatedAt;

    factory ServiceU.fromJson(Map<String, dynamic> json) => ServiceU(
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
