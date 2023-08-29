// ignore_for_file: must_be_immutable, unused_field, library_private_types_in_public_api

import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/user_model.dart';
import 'package:biomaj/widgets/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class EditProfilScreen extends StatefulWidget {

  UserModel? userDatas;

 EditProfilScreen({super.key, required this.userDatas});
  @override
  _EditProfilScreenState createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {

  TextEditingController contactEditingContrller = TextEditingController();
  TextEditingController firstNameEditingContrller = TextEditingController();
  TextEditingController lastNameEditingContrller = TextEditingController();
  TextEditingController emailEditingContrller = TextEditingController();
  TextEditingController lieuHabitationEditingContrller = TextEditingController();

  UserModel? user;

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader =  GlobalKey<State>();
  String loadingMessage = "Veuillez patienter s'il vous plaît ...";


  bool _status = true;
  final FocusNode myFocusNode = FocusNode();


  @override
  void initState() {

    // contactEditingContrller.text = widget.userDatas!.tel!;
    // firstNameEditingContrller.text  = widget.userDatas!.firstname!;
    // lastNameEditingContrller.text  = widget.userDatas!.lastname!;
    emailEditingContrller.text  = widget.userDatas!.email!;
    //lieuHabitationEditingContrller.text  = widget.clientDatas.lieuHabitation;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(100)),
        child: SimpleAppBarWidget(title: "Mes informations", context: context, showLeading: true),
      ),
      body: ListView(
        children: <Widget>[
       
        ],
      ),
    );
  }


  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  // Widget _getActionButtons() {
  //   return Padding(
  //     padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
  //     child: new Row(
  //       mainAxisSize: MainAxisSize.max,
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: <Widget>[

  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.only(left: 10.0),
  //             child: Container(
  //                 child: new RaisedButton(
  //                   child: new Text(
  //                       "Annuler",
  //                     style: TextStyle(
  //                         fontSize: 16.0,
  //                         fontFamily: 'MontserratMedium'
  //                     ),
  //                   ),
  //                   elevation: 0.0,
  //                   textColor: Colors.white,
  //                   color: Colors.redAccent,
  //                   onPressed: () {
  //                     setState(() {
  //                       _status = true;
  //                       FocusScope.of(context).requestFocus(new FocusNode());
  //                     });
  //                   },
  //                   shape: new RoundedRectangleBorder(
  //                       borderRadius: new BorderRadius.circular(20.0)),
  //                 )),
  //           ),
  //           flex: 2,
  //         ),

  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.only(left: 10.0),
  //             child: Container(
  //                 child: new RaisedButton(
  //                   child: new Text(
  //                       "Enregister",
  //                       style: TextStyle(
  //                           fontSize: 16.0,
  //                           fontFamily: 'MontserratMedium'
  //                       ),
  //                   ),
  //                   elevation: 0.0,
  //                   textColor: Colors.white,
  //                   color: AppColors.appThemeColor,
  //                   onPressed: () async {

  //                     userEditProfil();
  //                   },
  //                   shape: new RoundedRectangleBorder(
  //                       borderRadius: new BorderRadius.circular(20.0)),
  //                 )),
  //           ),
  //           flex: 2,
  //         ),

  //       ],
  //     ),
  //   );
  // }

  // Widget _getEditIcon() {

  //   return new GestureDetector(
  //     child: new CircleAvatar(
  //       backgroundColor: Colors.red,
  //       radius: 20.0,
  //       child: new Icon(
  //         Icons.edit,
  //         color: Colors.white,
  //         size: 20.0,
  //       ),
  //     ),
  //     onTap: () {
  //       setState(() {
  //         _status = false;
  //       });
  //     },
  //   );
  // }

  // logout() async {

  //   LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

  //   await httpGlobalDatasource
  //       .logout()
  //       .then((response) async {

  //       Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

  //       //print("***response***$response*");
  //       UserModel.clear();

  //       var prefs = await SharedPreferences.getInstance();

  //       //var user = await UserModel.fromPrefs();
  //       await prefs.clear();

  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //             builder: (BuildContext context) => LoginScreen()),
  //         ModalRoute.withName('/'),
  //       );

  //   }).catchError((err) {

  //       Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

  //     Toaster.showErrorToast(
  //         message:
  //         "Désolé une erreur s'est produite veuillez réessayer s'il vous plaît !",
  //         gravity: ToastGravity.TOP);
  //   });
  // }


  // userEditProfil() async {

  //   LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

  //   await httpGlobalDatasource
  //       .userEditProfil(
  //       firstname: firstNameEditingContrller.text,
  //       lastname: lastNameEditingContrller.text,
  //       tel: contactEditingContrller.text,
  //       email: emailEditingContrller.text,
  //   ).then((user) {

  //     Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

  //     Toaster.showSuccessToast(
  //         message: "Profil édité avec succès !",
  //         gravity: ToastGravity.TOP
  //     );

  //   }).catchError((err) {

  //     Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

  //     Toaster.showErrorToast(
  //         message: "Désolé mail ou numéro de télépone déjà utilisé !",
  //         gravity: ToastGravity.TOP
  //     );
  //   });
 // }
}
