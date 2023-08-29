
import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/list_exam.dart';
import 'package:biomaj/screens/examens/examen_en_cours_widget.dart';
import 'package:biomaj/widgets/drawer_menu/drawer_menu.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnalyseTermineScreen extends StatefulWidget {
  const AnalyseTermineScreen({Key? key}) : super(key: key);

  @override
  State<AnalyseTermineScreen> createState() => _AnalyseTermineScreenState();
}

class _AnalyseTermineScreenState extends State<AnalyseTermineScreen> {
  TextEditingController controller = TextEditingController();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";


  List<Examencours> _examenEncours = [];

  @override
  void initState() {
    //   _analyseTermine = _api.getanalyseterminelist(fake: true);

    Future.delayed(const Duration(milliseconds: 0), () {
      getanalyseencours();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawermenu(),
      backgroundColor: Colors.white,
      appBar: appBarmenu(
          context: context,
          title: "Analyses en cours",
          bgClr: Colors.white,
          color: Colors.black,
          elevation: 0),
      body:  _examenEncours.isNotEmpty
          ? Container(
              width: double.infinity,
              decoration: const BoxDecoration(
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
                  itemCount: _examenEncours.length,
                  itemBuilder: (context, index) {
                    return ExamenEncoursWidget(
                      examEncours: _examenEncours[index],
                    );
                  },
                ),
              ),
            )
          : Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImages.fontdecran,
                  ),
                ),
              ),
              child: const Center(
                child: Text("Vide"),
              )),
    );
  }





  getanalyseencours() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

    await httpGlobalDatasource.getexamenEncour().then((data) {
      Navigator.of(context).pop();
      setState(() {
        _examenEncours = data;
      });
    }).catchError((err) {
      Navigator.of(context).pop();

      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
