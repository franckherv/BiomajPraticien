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
        id: json["id"],
        jour: json["jour"],
        date: json["date"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "jour": jour,
        "date": date,
    };
}
