
class OperateurModel {

  OperateurModel({
    this.name,
    this.image,
    this.desc,
  });

  String? name;
  String? image;
  String? desc;

  factory OperateurModel.fromJson(Map<dynamic, dynamic> json) => OperateurModel(
    name: json["name"],
    image: json["image"],
    desc: json["desc"],
  );

  Map<dynamic, dynamic> toJson() => {
    "name": name,
    "image": image,
    "desc": desc,
  };
}
