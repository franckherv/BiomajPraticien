// To parse this JSON data, do
//
//     final dateModel = dateModelFromJson(jsonString);

import 'dart:convert';

DateModel dateModelFromJson(String str) => DateModel.fromJson(json.decode(str));

String dateModelToJson(DateModel data) => json.encode(data.toJson());

class DateModel {
    DateModel({
        this.id,
        this.jour,
        this.date,
    });

    int? id;
    String? jour;
    String? date;

    factory DateModel.fromJson(Map<dynamic, dynamic> json) => DateModel(
        id: json["id"] == null ? null : json["id"],
        jour: json["jour"] == null ? null : json["jour"],
        date: json["date"] == null ? null : json["date"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id == null ? null : id,
        "jour": jour == null ? null : jour,
        "date": date == null ? null : date,
    };
}
