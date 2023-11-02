// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/list_exam.dart';
import 'package:biomaj/screens/examens/examens_list_widget.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListExamensScreen extends StatefulWidget {
  String examData;
  ListExamensScreen({
    Key? key,
    required this.examData,
  }) : super(key: key);

  @override
  State<ListExamensScreen> createState() => _ListExamensScreenState();
}

class _ListExamensScreenState extends State<ListExamensScreen> {

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";

  List<ListExam> _examList = [];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      getExammenList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarmenu(
          context: context,
          title: "Liste examens",
          bgClr: Colors.white,
          color: Colors.black,
          elevation: 0),
      body: _examList.isNotEmpty
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
                  itemCount: _examList.length,
                  itemBuilder: (context, index) {
                    return ExamenListWidget(
                      examlist: _examList[index],
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

  getExammenList() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource.examenList(
      code: widget.examData)
        .then((data) {
      Navigator.of(context).pop();
      setState(() {
        _examList = data;
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
