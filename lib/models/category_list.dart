class Category {
    Category({
        this.id,
        this.title,
        this.image,
    });

    int? id;
    String? title;
    String? image;

    factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
    };
}