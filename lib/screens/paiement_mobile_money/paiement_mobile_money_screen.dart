// import 'package:flutter/material.dart';


// class PaiementMobileMoneyScreen extends StatefulWidget {
//   PackSmsModel paque;

//   PaiementMobileMoneyScreen({this.paque});

//   @override
//   _PaiementMobileMoneyScreenState createState() =>
//       _PaiementMobileMoneyScreenState();
// }

// class _PaiementMobileMoneyScreenState extends State<PaiementMobileMoneyScreen>
//     with TickerProviderStateMixin {
//   HttpPaiementDatasource _httpPaiementDatasource = HttpPaiementDatasource();
//   HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();

//   final GlobalKey<State> _keyLoader = new GlobalKey<State>();
//   String loadingMessage = "Connexion en cours ...";

//   int _selectedIndex;
//   OperateurModel _selectedOperateur;
//   SikaLoginModel _sikaLogin;
//   SikaPaiementResultModel _sikaPaiementResult;

//   List<OperateurModel> _operateurList = [];

//   final _paiementFormKeyNew = GlobalKey<FormState>();

//   TextEditingController telEditingContrller = TextEditingController();
//   TextEditingController oTPEditingContrller = TextEditingController();

//   final ApiServiceSimulation api = ApiServiceSimulation();

//   var uuid = Uuid();

//   @override
//   void initState() {
//     _operateurList = api.getOperateursList(fake: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(110.0),
//         child: SimpleAppBarWidget(
//             title: "Achat de pack ${widget.paque.name}",
//             context: context,
//             showLeading: true),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
//               child: Text("Veuillez choisir votre opérateur.",
//                   style: TextStyle(
//                       color: Colors.redAccent,
//                       fontSize: 16,
//                       fontFamily: 'MontserratMedium')),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10.0),
//               child: Container(
//                 height: 100,
//                 child: _buildChips(),
//               ),
//             ),
//             if (_selectedIndex != null && _operateurList.length > 0)
//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
//                 child: Text(_operateurList[_selectedIndex].desc,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.redAccent,
//                         fontSize: 14,
//                         fontFamily: 'MontserratBold')),
//               ),
//             Padding(
//               padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
//               child: Form(
//                 key: _paiementFormKeyNew,
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       width: double.infinity,
//                       child: Center(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(20.0),
//                               child: RoundedTextInputFieldWithBorder(
//                                 label: "Numéro de téléphone",
//                                 imputCtrl: telEditingContrller,
//                                 prefixIcn: Icon(Icons.phone),
//                                 inputType: TextInputType.phone,
//                                 inputAction: TextInputAction.next,
//                                 textColor: Colors.black54,
//                                 inputColor: Colors.black54,
//                                 tailText: 15,
//                                 obscure: false,
//                                 enabled: _selectedIndex != null && _operateurList.length > 0
//                                     ? true
//                                     : false,
//                               ),
//                             ),
//                             if (_selectedOperateur != null &&_selectedOperateur.name == "Orange Money")
//                               Padding(
//                                 padding: const EdgeInsets.all(20.0),
//                                 child: RoundedTextInputFieldWithBorder(
//                                   label: "Code de paiement",
//                                   imputCtrl: oTPEditingContrller,
//                                   prefixIcn: Icon(Icons.lock),
//                                   inputType: TextInputType.number,
//                                   inputAction: TextInputAction.done,
//                                   textColor: Colors.black54,
//                                   inputColor: Colors.black54,
//                                   tailText: 15,
//                                   obscure: false,
//                                   enabled: _selectedIndex != null &&
//                                           _operateurList.length > 0
//                                       ? true
//                                       : false,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 70.0, bottom: 10.0, left: 20.0, right: 20.0),
//                       child: Container(
//                         width: double.infinity,
//                         height: 50.0,
//                         child: smallRaisedBtn(
//                             label: "Payer maintenant",
//                             btnColor: _selectedIndex != null &&
//                                     _operateurList.length > 0
//                                 ? AppColors.darkAppThemeColor
//                                 : Colors.grey[200],
//                             labelColor: Colors.white,
//                             onPressAction: () async {
//                               if (_selectedOperateur != null &&
//                                   _selectedOperateur.name == "Orange Money" &&
//                                   telEditingContrller.text.isNotEmpty &&
//                                   oTPEditingContrller.text.isNotEmpty) {
//                                 login();
//                               } else if (_selectedOperateur != null &&
//                                   _selectedOperateur.name != "Orange Money" &&
//                                   telEditingContrller.text.isNotEmpty) {
//                                 login();
//                               } else {
//                                 Toaster.showWarningToast(
//                                     message:
//                                         "Désolé veuillez remplir le formulaire correctement s'il vous plaît !",
//                                     gravity: ToastGravity.TOP);
//                               }
//                             }),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildChips() {
//     List<Widget> chips = new List();

//     for (int i = 0; i < _operateurList.length; i++) {
//       ChoiceChip choiceChip = ChoiceChip(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(5))),
//         selected: _selectedIndex == i,
//         label: Container(
//           width: 100,
//           height: 70,
//           child: Column(
//             children: [
//               Expanded(
//                 child: Image.asset(
//                   _operateurList[i].image,
//                   fit: BoxFit.contain,
//                   height: 150.0,
//                   width: 150.0,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 5.0),
//                 child: Text(_operateurList[i].name,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontFamily: 'MontserratMedium')),
//               ),
//             ],
//           ),
//         ),
//         /*avatar: Image.asset(
//           _operateurList[i].image,
//           fit: BoxFit.contain,
//           height: 150.0,
//           width: 150.0,
//         ),*/
//         elevation: 0,
//         pressElevation: 5,
//         shadowColor: Colors.teal,
//         backgroundColor: Colors.white,
//         selectedColor: AppColors.darkAppThemeColor,
//         onSelected: (bool selected) {
//           setState(() {
//             if (selected) {
//               _selectedIndex = i;
//               _selectedOperateur = _operateurList[i];
//               telEditingContrller.clear();
//               oTPEditingContrller.clear();
//             }
//           });
//         },
//       );

//       chips.add(Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
//     }

//     return ListView(
//       // This next line does the trick.
//       scrollDirection: Axis.horizontal,
//       children: chips,
//     );
//   }

//   login() async {
//     LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

//     await _httpPaiementDatasource
//         .login(montant: widget.paque.prixTotal)
//         .then((result) {
//       //Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//       setState(() {
//         _sikaLogin = result;
//       });

//       if (_sikaLogin.token != null) {
//         setState(() {
//           loadingMessage = "Paiement en cours ...";
//         });
//         paiementSika();
//       } else {
//         Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//         Toaster.showErrorToast(
//             message:
//                 "Désolé une erreur s'est produite veuillez réessayer plus tard !",
//             gravity: ToastGravity.TOP);
//       }
//       //print('##_sikaLogin###${_sikaLogin.token}####');
//     }).catchError((err) {
//       print('##err###${err}####');
//       Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//       Toaster.showErrorToast(
//           message:
//               "Désolé une erreur s'est produite veuillez réessayer s'il vous plaît !",
//           gravity: ToastGravity.TOP);
//     });
//   }

//   paiementSika() async {
//     //LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

//     await _httpPaiementDatasource
//         .paiementSika(
//             token: _sikaLogin.token,
//             montant: widget.paque.prixTotal,
//             numcommande: uuid.v1(),
//             telephone: telEditingContrller.text,
//             otp: oTPEditingContrller.text,
//             pname: CommonVariable.localUserDatas != null
//                 ? CommonVariable.localUserDatas.lastname
//                 : "",
//             name: CommonVariable.localUserDatas != null
//                 ? CommonVariable.localUserDatas.firstname
//                 : "")
//         .then((result) {
//       //Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
//       setState(() {
//         _sikaPaiementResult = result;
//       });

//       if (_sikaPaiementResult != null && _sikaPaiementResult.code == 0) {
//         /*Toaster.showSuccessToast(
//             message:
//             "Paiement éffectué avec succès !",
//             gravity: ToastGravity.TOP
//         );*/
//         rechargementSms();
//       } else if (_sikaPaiementResult != null &&
//           _sikaPaiementResult.code == -1) {
//         Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//         Toaster.showErrorToast(
//             message: "Désolé votre paiement à échoué !",
//             gravity: ToastGravity.TOP);
//       } else if (_sikaPaiementResult != null &&
//           _sikaPaiementResult.code == -2) {
//         Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//         Toaster.showErrorToast(
//             message: "Désolé impossible de récupérer le marchand !",
//             gravity: ToastGravity.TOP);
//       } else if (_sikaPaiementResult != null &&
//           _sikaPaiementResult.code == -3) {
//         Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//         Toaster.showErrorToast(
//             message: "Désolé votre solde est insuffisant !",
//             gravity: ToastGravity.TOP);
//       } else if (_sikaPaiementResult != null &&
//           _sikaPaiementResult.code == -4) {
//         Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//         Toaster.showErrorToast(
//             message:
//                 "Désolé le service indisponible pour le moment veuillez réessayer plus tard!",
//             gravity: ToastGravity.TOP);
//       } else if (_sikaPaiementResult != null &&
//           _sikaPaiementResult.code == -5) {
//         Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//         Toaster.showErrorToast(
//             message: "Désolé échec du code OTP, veuillez réessayer!",
//             gravity: ToastGravity.TOP);
//       } else {
//         Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//         Toaster.showErrorToast(
//             message:
//                 "Désolé une erreur s'est produite veuillez réessayer s'il vous plaît !",
//             gravity: ToastGravity.TOP);
//       }

//       //print('##_sikaLogin###${_sikaLogin.token}####');
//     }).catchError((err) {
//       print('##err###${err}####');
//       Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//       Toaster.showErrorToast(
//           message:
//               "Désolé une erreur s'est produite veuillez réessayer s'il vous plaît !",
//           gravity: ToastGravity.TOP);
//     });
//   }

//   rechargementSms() async {
//     //LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

//     await httpGlobalDatasource
//         .rechargementSms(
//             packSmsId: widget.paque.id,
//             prixTotal: _sikaPaiementResult.amount,
//             prixUnitaire: widget.paque.prixUnitaire,
//             numeroRechargement: _sikaPaiementResult.mobile,
//             nbreSms: widget.paque.nbreSms,
//             status: 1,
//             transactionId: _sikaPaiementResult.transactionId,
//             paiementId: _sikaPaiementResult.paiementId,
//             orderId: _sikaPaiementResult.orderId,
//             operator: _sikaPaiementResult.operator)
//         .then((result) {
//       Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
//       //print("=====result======$result=====");
//       if (result != null && result.status == 1) {
//         if (_selectedOperateur != null &&
//             _selectedOperateur.name == "Orange Money") {
//           Toaster.showSuccessToast(
//               message:
//                   "Paiement en cours de validation ! \n Vous recevrez bientôt une notification",
//               //"Paiement éffectué avec succès !",
//               gravity: ToastGravity.TOP);
//         } else {
//           Toaster.showSuccessToast(
//               message:
//                   "Paiement en cours de validation ! \n Vous recevrez un SMS pour terminer le processus du paiement",
//               //"Paiement éffectué avec succès !",
//               gravity: ToastGravity.TOP);
//         }

//         Navigator.of(context).pushNamedAndRemoveUntil(
//             '/bottom-tab-widget', (Route<dynamic> route) => false,
//             arguments: BottomTabWidget(
//               pageIndex: 0,
//             ));
//       } else {
//         //TODO Envoyer une notif a textPRO
//         Toaster.showErrorToast(
//             message:
//                 "Désolé une erreur s'est produite veuillez réessayer s'il vous plaît !",
//             gravity: ToastGravity.TOP);
//       }

//       //print('##_sikaLogin###${_sikaLogin.token}####');
//     }).catchError((err) {
//       print('##err###${err}####');
//       Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

//       Toaster.showErrorToast(
//           message:
//               "Désolé une erreur s'est produite veuillez réessayer s'il vous plaît !",
//           gravity: ToastGravity.TOP);
//     });
//   }
// }
