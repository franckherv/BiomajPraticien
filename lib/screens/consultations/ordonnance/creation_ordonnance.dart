// ignore_for_file: unused_field, must_be_immutable

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/utils/rounded_text_input_field_with_border.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreationOrdonnance extends StatefulWidget {
  String? cnsulID;
  CreationOrdonnance({Key? key, this.cnsulID}) : super(key: key);

  @override
  State<CreationOrdonnance> createState() => _CreationOrdonnanceState();
}

class _CreationOrdonnanceState extends State<CreationOrdonnance> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();

  List<ListConsultingHospital> _listconsultation = [];

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();

  String loadingMessage = "Patientez svp";
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  // ignore: prefer_typing_uninitialized_variables

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Presciption d'ordonnance",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const ImageIcon(
              AssetImage(AppImages.backButton),
              color: Colors.black,
            ),
            onPressed: () => {Navigator.of(context).pop()},
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            //color: Colors.white.withOpacity(0.4),
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
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AppImages.fontdecran,
                      ),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0.5,
                        blurRadius: 8,
                        offset: Offset(0.7, 0.7),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(
                            ScreenUtil().setHeight(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(10),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Description",
                                          style: AppDesign.messervice,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(5),

                                        //  top: 50.0,
                                      ),
                                      child: RoundedTextInputFieldWithBorder(
                                        label: "Cliquez pour saisir",
                                        imputCtrl: descriptionController,
                                        maxLines: 3,
                                        inputType: TextInputType.multiline,
                                        inputAction: TextInputAction.newline,
                                        textColor: Colors.black54,
                                        inputColor: Colors.black54,
                                        tailText: 15,
                                        obscure: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 45.0,
                                  child: SmallRaisedBtn(
                                    width: double.infinity,
                                    onPressed: () {
                                      createNewOrdonnance();
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Text(
                                      "Enrégistrer",
                                      style: AppDesign.rstpwdstyle,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  createNewOrdonnance() async {
    setState(() {
      loadingMessage = "Demande en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .createOrdonnance(
            description: descriptionController.text,
            codeconsultation: widget.cnsulID)
        .then((datas) {
      if (datas["code"] == 1) {
        setState(() {
          isVisible = true;
        });
        Navigator.of(context).pop();

        displayToastmessage("Enrégistrement éffectué avec succeès !", context);

        Navigator.of(context).pop();
      }
    }).catchError((err, error) {
      displayToastmessage("Oupps! Une erreur s'est produite", context);
    });
  }

  getConsultationData() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

    await httpGlobalDatasource.getConsultingList().then((data) {
      Navigator.of(context).pop();
      setState(() {
        _listconsultation = data;
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
