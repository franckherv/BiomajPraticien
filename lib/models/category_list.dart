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
        id: json["id"],
        title: json["title"],
        image: json["image"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
    };
}