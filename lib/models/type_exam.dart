import 'dart:convert';

class TypeExam {
    final int? id;
    final String? libelletypeexamen;
    final dynamic descriptiontypeexamen;

    TypeExam({
        this.id,
        this.libelletypeexamen,
        this.descriptiontypeexamen,
    });

    factory TypeExam.fromRawJson(String str) => TypeExam.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TypeExam.fromJson(Map<String, dynamic> json) => TypeExam(
        id: json["id"],
        libelletypeexamen: json["libelletypeexamen"],
        descriptiontypeexamen: json["descriptiontypeexamen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "libelletypeexamen": libelletypeexamen,
        "descriptiontypeexamen": descriptiontypeexamen,
    };
}
