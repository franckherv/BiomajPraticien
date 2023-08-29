/*===================Do never remove these datas============================================*/

// List<Map> operateursList() {
//   return [
//     {
//       "name": "Orange Money",
//       "image": AppImages.orangeMoney,
//       "desc": "Composer #144*8*2# pour générer un code de paiement.",
//     },
//     {
//       "name": "MTN Money",
//       "image": AppImages.mtnMoney,
//       "desc": "Composer votre numéro pour éffectuer votre paiement.",
//     },
//     {
//       "name": "Moov Money",
//       "image": AppImages.moovMoney,
//       "desc": "Composer votre numéro pour éffectuer votre paiement.",
//     },

//   ];
// }
/*===================Do never remove these datas============================================*/

import 'package:biomaj/constants/app_images.dart';

List<Map> services() {
  return [
    {
      "id": 1,
      "title": "Recharger du crédit",
      "subtitle": "Transfert sur un compte",
      "image": AppImages.recharge,
    },
    {
      "id": 2,
      "title": "Transférer de l'argent",
      "subtitle": "Envoyé à quelqu'un",
      "image": AppImages.transfert,
    },
    {
      "id": 3,
      "title": "Acheter un pass",
      "subtitle": "Appel ou Internet",
      "image": AppImages.achatpass,
    },
    {
      "id": 4,
      "title": "Recevoir de l'argent",
      "subtitle": "Soumettre une demande",
      "image": AppImages.receive,
    }
  ];
}

List<Map> pubList() {
  return [
    {"id": 1, "name": "IDE", "image": AppImages.caroussel1},
    {"id": 2, "name": "Biologiste", "image": AppImages.caroussel2},
    {"id": 3, "name": "Sage Femme", "image": AppImages.caroussel3}
  ];
} 

List<Map> dayList() {
  return [
    {"id": 1, "jour": "Lun", "date": "14"},
    {"id": 2, "jour": "Mar", "date": "15"},
    {"id": 3, "jour": "Mer", "date": "16"},
    {"id": 4, "jour": "Jeu", "date": "17"},
  ];
}

List<Map> matinList() {
  return [
    {"id": 1, "heure": "08:00"},
    {"id": 2, "heure": "08:30"},
    {"id": 3, "heure": "09:30"},
  ];
}

List<Map> soirList() {
  return [
    {"id": 1, "heure": "14:00"},
    {"id": 2, "heure": "14:30"},
    {"id": 3, "heure": "16:00"},
  ];
}

List<Map> medecinList() {
  return [
    {"id": 1, "name": "Marc Arthur"},
    {"id": 2, "name": "Gouët olivier"},
    {"id": 3, "name": "Rachelle"},
    {"id": 4, "name": "Ronald"},
  ];
}

List<Map> analyseTermineList() {
  return [
    {"id": 1, "analyse": "Analyse générale"},
    {"id": 2, "analyse": "Glycémie"},
    {"id": 3, "analyse": "Bilan hépatique"},
    {"id": 4, "analyse": "Bilan rénal"},
  ];
}

List<Map> analysePriscriteList() {
  return [
    // {"id": 1, "analyse": "Analyse générale"},
    // {"id": 2, "analyse": "Glycémie"},
    // {"id": 3, "analyse": "Bilan hépatique"},
    // {"id": 4, "analyse": "Bilan rénal"},
  ];
}

List<Map> ordonnanceList() {
  return [
    {"id": 1, "ord": "Ordonnance 1"},
      {"id": 2, "ord": "Ordonnance 2"},
       {"id": 3, "ord": "Ordonnance 3"},
       {"id": 4, "ord": "Ordonnance 4"},
  ];
}

List<Map> serviceList() {
  return [
    {"id": 1, "name": "Analyse de sang"},
    {"id": 2, "name": "radio"},
    {"id": 3, "name": "Analyse d'urine"},
  ];
}

List<Map> consultList() {
  return [
    {
      "id": 1, 
      "title": "Ma première consultation",
      },
    {
      "id": 2, 
      "title": "Ma deuxième consultation"
      },
    {
      "id": 3, 
      "title": "troisième consultation"
      },
  ];
}

List<Map> categoryList() {
  return [
    {"id": 1, "title": "Consultation", "image": AppImages.consultation},
    {"id": 2, "title": "Examen", "image": AppImages.examen},
  ];
}

Map userInfo() {
  return {
    "name": "John Doe",
    "email": "John Doe",
    "contact": "John Doe",
    "profession": "John Doe",
    "groupSan": "John Doe",
    "maladiChroniq": "",
    "alergie": "",
    "antecedent": {
        "name": "John Doe",
    "email": "John Doe",
    "contact": "John Doe",
    "profession": "John Doe",
    }
  };
}
