import 'package:biomaj/models/preferences.dart';
import 'package:biomaj/models/token.dart';

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.name,
    this.email,
    this.contact,
    this.profession,
    this.groupSan,
    this.maladiChroniq,
    this.alergie,
    this.antecedent,
  });

  String? name;
  String? email;
  String? contact;
  String? profession;
  String? groupSan;
  String? maladiChroniq;
  String? alergie;
  Antecedent? antecedent;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        contact: json["contact"] == null ? null : json["contact"],
        profession: json["profession"] == null ? null : json["profession"],
        groupSan: json["groupSan"] == null ? null : json["groupSan"],
        maladiChroniq:
            json["maladiChroniq"] == null ? null : json["maladiChroniq"],
        alergie: json["alergie"] == null ? null : json["alergie"],
        antecedent: json["antecedent"] == null
            ? null
            : Antecedent.fromJson(json["antecedent"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "contact": contact == null ? null : contact,
        "profession": profession == null ? null : profession,
        "groupSan": groupSan == null ? null : groupSan,
        "maladiChroniq": maladiChroniq == null ? null : maladiChroniq,
        "alergie": alergie == null ? null : alergie,
        "antecedent": antecedent == null ? null : antecedent!.toJson(),
      };
}

class Antecedent {
  Antecedent({
    this.name,
    this.email,
    this.contact,
    this.profession,
  });

  String? name;
  String? email;
  String? contact;
  String? profession;

  factory Antecedent.fromJson(Map<String, dynamic> json) => Antecedent(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        contact: json["contact"] == null ? null : json["contact"],
        profession: json["profession"] == null ? null : json["profession"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "contact": contact == null ? null : contact,
        "profession": profession == null ? null : profession,
      };
}

class UserModels {
   int? id;
  String? nomuser;
  String? prenomuser;
  dynamic lieunaissanceuser;
  dynamic datenaissanceuser;
  String? sexeuser;
  dynamic lieuresidenceuser;
  String? contactone;
  dynamic contacttwo;

  dynamic email;

  Token? token;

  static final String _prefsKey = SharedPrefs.keys.user;

//pro user model

  UserModels({
    this.id,
    this.nomuser,
    this.prenomuser,
    this.lieunaissanceuser,
    this.datenaissanceuser,
    this.sexeuser,
    this.lieuresidenceuser,
    this.contactone,
    this.contacttwo,
    this.email,
    this.token,
  });

  UserModels.fromJson(Map map)
      : id = map["id"],
        nomuser = map["nomuser"],
        prenomuser = map["prenomuser"],
        lieunaissanceuser = map["lieunaissanceuser"],
        datenaissanceuser = map["datenaissanceuser"],
        sexeuser = map["sexeuser"],
        lieuresidenceuser = map["lieuresidenceuser"],
        contactone = map["contactone"],
        contacttwo = map["contacttwo"],
        email = map["email"],
        token = map['token'] == null ? null : Token.fromJson(map['token']);

   static UserModels? fromPrefs() {
    Preference<String> encodedUser =
        SharedPrefs.instance!.getString(_prefsKey, defaultValue: '');

    String val = encodedUser.getValue();
    if (val == "") {
      return null;
    }
    
    return UserModels.fromJson(jsonDecode(val));
  }

  /// Save the instance of user in shared preferences and same user instance
  Future<UserModels> store({bool preserveToken = false}) async {
    if (preserveToken) {
      this.token ??= UserModels.fromPrefs()!.token;
    }

    await SharedPrefs.instance!.setString(_prefsKey, jsonEncode(toJson()));
//    final preferences = await StreamingSharedPreferences.instance;
//    await preferences.setString(_prefsKey, jsonEncode(toJson()));
    // Update the provider;
    return this;
  }  





  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "nomuser": nomuser == null ? null : nomuser,
        "prenomuser": prenomuser == null ? null : prenomuser,
        "lieunaissanceuser": lieunaissanceuser,
        "datenaissanceuser": datenaissanceuser,
        "sexeuser": sexeuser == null ? null : sexeuser,
        "lieuresidenceuser": lieuresidenceuser,
        "contactone": contactone == null ? null : contactone,
        "contacttwo": contacttwo,
        "email": email,
        'token': token!.toJson(),
    };
  }

  static Future<void> clear() async {
    //  final store = Provider.of<Store>(globalContext, listen: false);
    // Remove the user from the shared preferences.
    await SharedPrefs.instance!.remove(_prefsKey);
    // Clear the provider.
    //store.user = null;
    //await store.shopState.clear(); // Remove shop data;
    //UserController().updateUserProvider(null /* Setting the user to null. */);
  }
}


/*class UserModel {

  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? tel;
  final String? adresse;


  Token? token;

  static final String _prefsKey = SharedPrefs.keys.user;

  UserModel({
        this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.tel,
        this.adresse,
        this.token,
  });

  UserModel.fromJson(Map map):
        id = map["id"],
        firstname = map["firstname"],
        lastname = map["lastname"],
        email = map["email"],
        tel = map["tel"],
        token = map['token'] == null ? null : Token.fromJson(map['token']),
        adresse = map["adresse"] == null ? null : map["adresse"];

} */

