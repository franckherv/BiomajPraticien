class RdvStatusModel {
    RdvStatusModel({
       required this.id,
       required this.name,
    });

    int id;
    String name;

    factory RdvStatusModel.fromJson(Map<dynamic, dynamic> json) => RdvStatusModel(
        id: json["id"],
        name: json["name"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
      @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RdvStatusModel &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}