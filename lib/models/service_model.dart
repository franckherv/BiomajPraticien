
class Service {
    Service({
        this.id,
        this.title,
        this.subtitle,
        this.image,
    });

    int? id;
    String? title;
    String? subtitle;
    String? image;

    factory Service.fromJson(Map<dynamic, dynamic> json) => Service(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "image": image,
    };
}
