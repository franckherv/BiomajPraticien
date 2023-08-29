// ignore_for_file: unused_field

import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/widgets/drawer_menu/drawer_menu.dart';
import 'package:flutter/material.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();

  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Veuillez patienter s'il vous plaît ...";
 // TabController _tabController;

  bool _isLoading = false;
  bool initLoadingDatas = true;
  bool isLoadingMore = false;

 // UserModel user;
  @override
  void initState() {
    // if ((CommonVariable.userTken != null)) {
    //   Future.delayed(const Duration(milliseconds: 0), () {
    //     getConnectedUserInfo();
    //   });
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawermenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
         iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Notifications", style: TextStyle(color: Colors.black),),
       
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          //color: Colors.white.withOpacity(0.4),
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          image: DecorationImage(
              fit: BoxFit.cover,
              image:  AssetImage(
                AppImages.fontdecran,
              ),
             ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.notifications,
              color: AppColors.appThemeColor,
            ),
            Text("Notification")
          ],
        ),
      ),
    );
  }

  // getConnectedUserInfo() async {
  //   LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

  //   await httpGlobalDatasource.getConnectedUserInfo().then((response) {
  //     Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

  //     setState(() {
  //       user = response;
  //     });
  //     print("****** ${user.firstname} ******");
  //   }).catchError((err, stacktrace) {
  //     print("###error stacktrace####${stacktrace}###");

  //     //  Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

  //     Toaster.showErrorToast(
  //         message:
  //             "Désolé une erreur s'est produite veuillez réessayer s'il vous plaît !",
  //         gravity: ToastGravity.TOP);
  //   });
  // }
}
