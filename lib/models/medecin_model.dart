
class MedecinModel {
    MedecinModel({
        this.id,
        this.serviceId,
        this.hopitalId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.statut,
        this.medecin,
    });

    int? id;
    int? serviceId;
    int? hopitalId;
    int? userId;
    var createdAt;
    var updatedAt;
    int? statut;
    Medecin? medecin;

    factory MedecinModel.fromJson(Map<dynamic, dynamic> json) => MedecinModel(
        id: json["id"],
        serviceId: json["service_id"],
        hopitalId: json["hopital_id"],
        userId: json["user_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        statut: json["statut"],
        medecin: json["medecin"] == null ? null : Medecin.fromJson(json["medecin"]),

    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "service_id": serviceId,
        "hopital_id": hopitalId,
        "user_id": userId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "statut": statut,
        "medecin": medecin,
    };
}

class Medecin {
    Medecin({
        this.id,
        this.useraddId,
        this.userdelId,
        this.userupdId,
        this.dateadd,
        this.datedel,
        this.dateupd,
        this.nomuser,
        this.prenomuser,
        this.lieunaissanceuser,
        this.datenaissanceuser,
        this.sexeuser,
        this.lieuresidenceuser,
        this.contact1User,
        this.contact2User,
        this.indicateurpays,
        this.posteuser,
        this.fixeuser,
        this.numeropiece,
        this.matriculeuser,
        this.lienimageuser,
        this.etatconnecte,
        this.affichageuser,
        this.connecteToken,
        this.confirme,
        this.username,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.civilite,
        this.typeuser,
        this.dateentree,
        this.daterenouvel,
        this.datesortie,
        this.societeId,
        this.assurance,
        this.statutId,
        this.communeId,
    });

    int? id;
    int? useraddId;
    int? userdelId;
    int? userupdId;
    String? dateadd;
    String? datedel;
    String? dateupd;
    String? nomuser;
    String? prenomuser;
    dynamic lieunaissanceuser;
    dynamic datenaissanceuser;
    String? sexeuser;
    String? lieuresidenceuser;
    String? contact1User;
    String? contact2User;
    String? indicateurpays;
    dynamic posteuser;
    dynamic fixeuser;
    dynamic numeropiece;
    String? matriculeuser;
    String? lienimageuser;
    String? etatconnecte;
    String? affichageuser;
    String? connecteToken;
    int? confirme;
    String? username;
    String? email;
    String? createdAt;
    String? updatedAt;
    String? civilite;
    String? typeuser;
    dynamic dateentree;
    dynamic daterenouvel;
    dynamic datesortie;
    int? societeId;
    dynamic assurance;
    int? statutId;
    dynamic communeId;

    factory Medecin.fromJson(Map<dynamic, dynamic> json) => Medecin(
        id: json["id"],
        useraddId: json["useradd_id"],
        userdelId: json["userdel_id"],
        userupdId: json["userupd_id"],
        dateadd: json["dateadd"],
        datedel: json["datedel"],
        dateupd: json["dateupd"],
        nomuser: json["nomuser"],
        prenomuser: json["prenomuser"],
        lieunaissanceuser: json["lieunaissanceuser"],
        datenaissanceuser: json["datenaissanceuser"],
        sexeuser: json["sexeuser"],
        lieuresidenceuser: json["lieuresidenceuser"],
        contact1User: json["contact1user"],
        contact2User: json["contact2user"],
        indicateurpays: json["indicateurpays"],
        posteuser: json["posteuser"],
        fixeuser: json["fixeuser"],
        numeropiece: json["numeropiece"],
        matriculeuser: json["matriculeuser"],
        lienimageuser: json["lienimageuser"],
        etatconnecte: json["etatconnecte"],
        affichageuser: json["affichageuser"],
        connecteToken: json["connecte_token"],
        confirme: json["confirme"],
        username: json["username"],
        email: json["email"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        civilite: json["civilite"],
        typeuser: json["typeuser"],
        dateentree: json["dateentree"],
        daterenouvel: json["daterenouvel"],
        datesortie: json["datesortie"],
        societeId: json["societe_id"],
        assurance: json["assurance"],
        statutId: json["statut_id"],
        communeId: json["commune_id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "useradd_id": useraddId,
        "userdel_id": userdelId,
        "userupd_id": userupdId,
        "dateadd": dateadd,
        "datedel": datedel,
        "dateupd": dateupd,
        "nomuser": nomuser,
        "prenomuser": prenomuser,
        "lieunaissanceuser": lieunaissanceuser,
        "datenaissanceuser": datenaissanceuser,
        "sexeuser": sexeuser,
        "lieuresidenceuser": lieuresidenceuser,
        "contact1user": contact1User,
        "contact2user": contact2User,
        "indicateurpays": indicateurpays,
        "posteuser": posteuser,
        "fixeuser": fixeuser,
        "numeropiece": numeropiece,
        "matriculeuser": matriculeuser,
        "lienimageuser": lienimageuser,
        "etatconnecte": etatconnecte,
        "affichageuser": affichageuser,
        "connecte_token": connecteToken,
        "confirme": confirme,
        "username": username,
        "email": email,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "civilite": civilite,
        "typeuser": typeuser,
        "dateentree": dateentree,
        "daterenouvel": daterenouvel,
        "datesortie": datesortie,
        "societe_id": societeId,
        "assurance": assurance,
        "statut_id": statutId,
        "commune_id": communeId,
    };
}
