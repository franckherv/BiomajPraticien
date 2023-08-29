class OrdonnanceModel {
    OrdonnanceModel({
        this.id,
        this.ord,
    });

    int? id;
    String? ord;

    factory OrdonnanceModel.fromJson(Map<dynamic, dynamic> json) => OrdonnanceModel(
        id: json["id"] == null ? null : json["id"],
        ord: json["ord"] == null ? null : json["ord"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id == null ? null : id,
        "ord": ord == null ? null : ord,
    };
}