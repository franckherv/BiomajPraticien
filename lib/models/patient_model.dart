import 'dart:convert';

class Patient {
  final int id;
  final int useraddId;
  final int userdelId;
  final int userupdId;
  final DateTime dateadd;
  final DateTime datedel;
  final DateTime dateupd;
  final String nomuser;
  final String prenomuser;
  final dynamic lieunaissanceuser;
  final dynamic datenaissanceuser;
  final String sexeuser;
  final dynamic lieuresidenceuser;
  final String contact1User;
  final dynamic contact2User;
  final String indicateurpays;
  final dynamic posteuser;
  final dynamic fixeuser;
  final String matriculeuser;
  final String lienimageuser;
  final String etatconnecte;
  final String affichageuser;
  final String connecteToken;
  final String username;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String civilite;
  final dynamic typeuser;
  final dynamic dateentree;
  final dynamic datesortie;
  final dynamic assurance;
  final String cmu;
  final String profession;
  final String secteurActivite;
  final dynamic secteurActive;
  final String personneUrgeencChirug;
  final String personneUrgence;
  final String allergie;
  final String allergieName;
  final String asthme;
  final String diabete;
  final String maladieCoeur;
  final String epilepsie;
  final String hypertensionArterielle;
  final String autreMaladie;
  final String groupeSanguin;
  final String tensionArterielle;
  final String statutElectrophoretique;
  final dynamic communeId;

  Patient({
    required this.id,
    required this.useraddId,
    required this.userdelId,
    required this.userupdId,
    required this.dateadd,
    required this.datedel,
    required this.dateupd,
    required this.nomuser,
    required this.prenomuser,
    required this.lieunaissanceuser,
    required this.datenaissanceuser,
    required this.sexeuser,
    required this.lieuresidenceuser,
    required this.contact1User,
    required this.contact2User,
    required this.indicateurpays,
    required this.posteuser,
    required this.fixeuser,
    required this.matriculeuser,
    required this.lienimageuser,
    required this.etatconnecte,
    required this.affichageuser,
    required this.connecteToken,
    required this.username,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.civilite,
    required this.typeuser,
    required this.dateentree,
    required this.datesortie,
    required this.assurance,
    required this.cmu,
    required this.profession,
    required this.secteurActivite,
    required this.secteurActive,
    required this.personneUrgeencChirug,
    required this.personneUrgence,
    required this.allergie,
    required this.allergieName,
    required this.asthme,
    required this.diabete,
    required this.maladieCoeur,
    required this.epilepsie,
    required this.hypertensionArterielle,
    required this.autreMaladie,
    required this.groupeSanguin,
    required this.tensionArterielle,
    required this.statutElectrophoretique,
    required this.communeId,
  });

  factory Patient.fromRawJson(String str) => Patient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        useraddId: json["useradd_id"],
        userdelId: json["userdel_id"],
        userupdId: json["userupd_id"],
        dateadd: DateTime.parse(json["dateadd"]),
        datedel: DateTime.parse(json["datedel"]),
        dateupd: DateTime.parse(json["dateupd"]),
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
        matriculeuser: json["matriculeuser"],
        lienimageuser: json["lienimageuser"],
        etatconnecte: json["etatconnecte"],
        affichageuser: json["affichageuser"],
        connecteToken: json["connecte_token"],
        username: json["username"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        civilite: json["civilite"],
        typeuser: json["typeuser"],
        dateentree: json["dateentree"],
        datesortie: json["datesortie"],
        assurance: json["assurance"],
        cmu: json["cmu"],
        profession: json["profession"],
        secteurActivite: json["secteur_activite"],
        secteurActive: json["secteur_active"],
        personneUrgeencChirug: json["personne_urgeenc_chirug"],
        personneUrgence: json["personne_urgence"],
        allergie: json["allergie"],
        allergieName: json["allergie_name"],
        asthme: json["asthme"],
        diabete: json["diabete"],
        maladieCoeur: json["maladie_coeur"],
        epilepsie: json["epilepsie"],
        hypertensionArterielle: json["hypertension_arterielle"],
        autreMaladie: json["autre_maladie"],
        groupeSanguin: json["groupe_sanguin"],
        tensionArterielle: json["tension_arterielle"],
        statutElectrophoretique: json["statut_electrophoretique"],
        communeId: json["commune_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "useradd_id": useraddId,
        "userdel_id": userdelId,
        "userupd_id": userupdId,
        "dateadd": dateadd.toIso8601String(),
        "datedel": datedel.toIso8601String(),
        "dateupd": dateupd.toIso8601String(),
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
        "matriculeuser": matriculeuser,
        "lienimageuser": lienimageuser,
        "etatconnecte": etatconnecte,
        "affichageuser": affichageuser,
        "connecte_token": connecteToken,
        "username": username,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "civilite": civilite,
        "typeuser": typeuser,
        "dateentree": dateentree,
        "datesortie": datesortie,
        "assurance": assurance,
        "cmu": cmu,
        "profession": profession,
        "secteur_activite": secteurActivite,
        "secteur_active": secteurActive,
        "personne_urgeenc_chirug": personneUrgeencChirug,
        "personne_urgence": personneUrgence,
        "allergie": allergie,
        "allergie_name": allergieName,
        "asthme": asthme,
        "diabete": diabete,
        "maladie_coeur": maladieCoeur,
        "epilepsie": epilepsie,
        "hypertension_arterielle": hypertensionArterielle,
        "autre_maladie": autreMaladie,
        "groupe_sanguin": groupeSanguin,
        "tension_arterielle": tensionArterielle,
        "statut_electrophoretique": statutElectrophoretique,
        "commune_id": communeId,
      };

  String getNom() {
    if (nomuser.isEmpty && nomuser != "") {
      return nomuser;
    } else {
      return "";
    }
  }

  String getPrenon() {
    if (prenomuser.isEmpty && prenomuser != "") {
      return prenomuser;
    } else {
      return "";
    }
  }
}
