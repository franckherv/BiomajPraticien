// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';



// class DisplayRechargementWidget extends StatelessWidget {

//   HistoriqueRechargementModel rechargement;

//   DisplayRechargementWidget({@required this.rechargement});

//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       height: 100.0,
//       child: Card(
//         elevation: 2.0,
//         child: Row(
//           children: [

//             ClipRRect(
//               borderRadius: BorderRadius.circular(100),
//               child: Icon(
//                 Icons.access_time,
//                 size: 30.0,
//                 color: Colors.black54,
//               ),
//             ),

//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 10.0, top: 2.0),
//                     child: Text(
//                       "Pack: ${rechargement.packSms.name}",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                           fontFamily: 'MontserratBold'
//                       ),
//                       //overflow: TextOverflow.visible,
//                     ),
//                   ),
//                 ),

//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 10.0, top: 2.0),
//                     child: Text(
//                       "SMS: ${rechargement.nbreSms}",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                           fontFamily: 'MontserratBold'
//                       ),
//                       //overflow: TextOverflow.visible,
//                     ),
//                   ),
//                 ),

//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 10.0, top: 2.0),
//                     child: Text(
//                       "Prix: ${rechargement.packSms.prixTotal} CFA",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                           fontFamily: 'MontserratBold'
//                       ),
//                       //overflow: TextOverflow.visible,
//                     ),
//                   ),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: RichText(
//                     textAlign: TextAlign.start,
//                     text: TextSpan(
//                       text: "Rechargé le ",
//                       style: TextStyle(
//                         //foreground: Paint()..shader = AppColors.linearGradient,
//                           fontSize: 13,
//                           fontFamily: 'MontserratMedium',
//                           color: Colors.black54
//                       ),
//                       children: <TextSpan>[

//                         TextSpan(
//                             text: CommonVariable.ddMMYYFormat.format(DateTime.parse(rechargement.createdAt)),
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 13,
//                                 fontFamily: 'MontserratBold')
//                         ),

//                         TextSpan(
//                             text: " à ",
//                             style: TextStyle(
//                                 color: Colors.black54,
//                                 fontSize: 13,
//                                 fontFamily: 'MontserratMedium')
//                         ),

//                         TextSpan(
//                             text: CommonVariable.hhMMFormat.format(DateTime.parse(rechargement.createdAt)),
//                             style: TextStyle(
//                                 fontSize: 13,
//                                 fontFamily: 'MontserratBold',
//                                 color: Colors.black
//                             )
//                         ),


//                       ],
//                     ),
//                   ),
//                 ),


//               ],
//             ),

//             Spacer(),

//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [

//                 Padding(
//                   padding: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
//                   child: rechargement.status == 1 ?
//                   Icon(
//                     FontAwesomeIcons.spinner,
//                     color: AppColors.blueColor,
//                   )
//                   :
//                   rechargement.status == 2 ?
//                   Icon(
//                     Icons.check,
//                     color: AppColors.appThemeColor,
//                   )
//                   :
//                   Icon(
//                     Icons.clear,
//                     color: Colors.redAccent,
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
//                   child: Text(
//                     rechargement.status == 1 ? "En cours" : rechargement.status == 2 ? "Terminé" : "Echoué",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         fontSize: ScreenUtil().setWidth(15),
//                         color: rechargement.status == 1 ?
//                         AppColors.blueColor :
//                         rechargement.status == 2 ?
//                         AppColors.appThemeColor :
//                         Colors.redAccent,
//                         fontFamily: 'MontserratBold'
//                     ),
//                     //overflow: TextOverflow.visible,
//                   ),
//                 )

//               ],
//             )

//           ],
//         ),
//       ),
//     );
//   }
// }
