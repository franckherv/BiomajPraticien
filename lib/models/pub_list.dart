

class Pub {
    Pub({
        this.id,
        this.name,
        this.image,
    });

    int? id;
    String? name;
    String? image;

    factory Pub.fromJson(Map<dynamic, dynamic> json) => Pub(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
    };
}
