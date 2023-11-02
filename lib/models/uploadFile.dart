// To parse this JSON data, do
//
//     final uploadFile = uploadFileFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

UploadFile uploadFileFromJson(String str) => UploadFile.fromJson(json.decode(str));

String uploadFileToJson(UploadFile data) => json.encode(data.toJson());

class UploadFile {
    int? code;
    String? message;
    List<Datum> data;

    UploadFile({
        this.code,
        this.message,
        required this.data,
    });

    factory UploadFile.fromJson(Map<String, dynamic> json) => UploadFile(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? analyseId;

    Datum({
        this.id,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.analyseId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        analyseId: json["analyse_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "analyse_id": analyseId,
    };
}
