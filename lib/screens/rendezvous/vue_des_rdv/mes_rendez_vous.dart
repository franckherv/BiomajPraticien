import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/rendez_vous_model.dart';
import 'package:biomaj/screens/rendezvous/vue_des_rdv/mesrdv_vue_widget.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MesRendezvousvue extends StatefulWidget {
  const MesRendezvousvue({Key? key}) : super(key: key);

  @override
  State<MesRendezvousvue> createState() => _MesRendezvousvueState();
}

class _MesRendezvousvueState extends State<MesRendezvousvue> {

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader =  GlobalKey<State>();
  String loadingMessage = "Patientez svp";

  // List<ConsultationModel> _rdvList = [];
  List<RendvModel> _rdvList = [];

  @override
  void initState() {
    //_rdvList = _api.getConsultinglist(fake: true);
    Future.delayed(const Duration(milliseconds: 0), () {
      getRendezvousdata();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  print("=================${_rdvList[0].services}===========================");
  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarmenu(
          context: context,
          title: "Mes rendez-vous",
          bgClr: Colors.white,
          color: Colors.black,
          elevation: 0),
      body: _rdvList.isNotEmpty
          ? Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImages.fontdecran,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setHeight(15),
                    vertical: ScreenUtil().setHeight(10)),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: _rdvList.length,
                  itemBuilder: (context, index) {
                    return MesrendezvousVueWidget(
                      rendevouslist: _rdvList[index],
                    );
                  },
                ),
              ),
            )
          : Container(),
    );
  }

  getRendezvousdata() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

    await httpGlobalDatasource.getrdvList().then((data) {
      Navigator.of(context).pop();
      setState(() { 
        _rdvList = data;
      });
    }).catchError((err) {
      print("**err**$err********");

      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
