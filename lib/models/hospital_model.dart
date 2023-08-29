class medecinModel {
    medecinModel({
        this.id,
        this.name,
    });

    int? id;
    String? name;

    factory medecinModel.fromJson(Map<dynamic, dynamic> json) => medecinModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
    };
}