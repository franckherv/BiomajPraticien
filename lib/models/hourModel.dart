

// class HourModel {
//     HourModel({
//         this.periode,
//         this.donne,
//     });

//     String? periode;
//     List<Donne>? donne;

//     factory HourModel.fromJson(Map<dynamic, dynamic> json) => HourModel(
//         periode: json["periode"] == null ? null : json["periode"],
//         donne: json["donne"] == null ? null : List<Donne>.from(json["donne"].map((x) => Donne.fromJson(x))),
//     );

//     Map<dynamic, dynamic> toJson() => {
//         "periode": periode == null ? null : periode,
//         "donne": donne == null ? null : List<dynamic>.from(donne!.map((x) => x.toJson())),
//     };
// }

// class Donne {
//     Donne({
//         this.id,
//         this.heure,
//     });

//     int? id;
//     String? heure;

//     factory Donne.fromJson(Map<String, dynamic> json) => Donne(
//         id: json["id"] == null ? null : json["id"],
//         heure: json["heure"] == null ? null : json["heure"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "heure": heure == null ? null : heure,
//     };
// }

// To parse this JSON data, do
//
//     final matModel = matModelFromJson(jsonString);


// To parse this JSON data, do
//
//     final soirModel = soirModelFromJson(jsonString);


class SoirModel {
    SoirModel({
        this.id,
        this.heure,
    });

    int? id;
    String? heure;

    factory SoirModel.fromJson(Map<dynamic, dynamic> json) => SoirModel(
        id: json["id"] == null ? null : json["id"],
        heure: json["heure"] == null ? null : json["heure"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id == null ? null : id,
        "heure": heure == null ? null : heure,
    };
}


class MatModel {
    MatModel({
        this.id,
        this.heure,
    });

    int? id;
    String? heure;

    factory MatModel.fromJson(Map<dynamic, dynamic> json) => MatModel(
        id: json["id"] == null ? null : json["id"],
        heure: json["heure"] == null ? null : json["heure"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id == null ? null : id,
        "heure": heure == null ? null : heure,
    };
}

