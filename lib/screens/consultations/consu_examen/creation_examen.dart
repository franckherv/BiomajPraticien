// ignore_for_file: must_be_immutable

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

class CreationExamen extends StatefulWidget {
  String? cnsulID;
  CreationExamen({Key? key, this.cnsulID}) : super(key: key);

  @override
  State<CreationExamen> createState() => _CreationExamenState();
}

class _CreationExamenState extends State<CreationExamen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController nameExamCobtroller = TextEditingController();
  final TextEditingController typeexamenController = TextEditingController();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();

  List<ExmprMdl> _examenList = [];
  List<Prescription> _prescriptionList = [];
  String loadingMessage = "Patientez svp";
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  // ignore: prefer_typing_uninitialized_variables
  var value1;
  var value2;
  String? examId;
  String? serviceID;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      getexamen();
    });
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
            "Création d'examen",
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
                                        bottom: ScreenUtil().setHeight(10),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Type d'examens",
                                          style: AppDesign.messervice,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(child: FormField<ExmprMdl>(
                                          builder: (FormFieldState state) {
                                            return InputDecorator(
                                              decoration: InputDecoration(
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white,
                                                      width: 0.0),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: 8.0,
                                                        left: 8.0,
                                                        right: 10),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<ExmprMdl>(
                                                  value: value1,
                                                  iconSize: 30,
                                                  icon: const Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 15,
                                                    color: Colors.black,
                                                  ),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'MontserratRegular'),
                                                  hint: const Text(
                                                      'Cliquez pour sélectionner'),
                                                  onChanged: (ggvalue) {
                                                    setState(() {
                                                      value1 = ggvalue;
                                                      examId = ggvalue!.id
                                                          .toString();
                                                      value2 = null;
                                                    });
                                                    getprescription();
                                                  },
                                                  items: _examenList.isEmpty
                                                      ? []
                                                      : _examenList.map((item) {
                                                          return DropdownMenuItem(
                                                            value: item,
                                                            child: Text(
                                                                item
                                                                    .libelletypeexamen!,
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16)),
                                                          );
                                                        }).toList(),
                                                ),
                                              ),
                                            );
                                          },
                                        )),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(5),
                                        top: ScreenUtil().setHeight(10),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Type examens",
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
                                        imputCtrl: typeexamenController,
                                        inputType: TextInputType.multiline,
                                        inputAction: TextInputAction.newline,
                                        textColor: Colors.black54,
                                        inputColor: Colors.black54,
                                        tailText: 15,
                                        obscure: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(5),
                                        top: ScreenUtil().setHeight(10),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Renseignement clinique",
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
                                      if (descriptionController
                                          .text.isNotEmpty) {
                                        createNewExam();
                                      }
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

  createNewExam() async {
    setState(() {
      loadingMessage = "Demande en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .createExam(
            name: descriptionController.text,
            codeconsultation: widget.cnsulID!,
           // typeExamen: typeexamenController
            )
        .then((datas) {
      Navigator.of(context).pop();
      if (datas["code"] == 1) {
        // Future.delayed(const Duration(milliseconds: 0), () {
        //   getexamen();
        // });
        displayToastmessage("Enrégistrement éffectué avec succeès !", context);
        Navigator.of(context).pop();
      }
    }).catchError((err, error) {
      Navigator.of(context).pop();

      displayToastmessage("Oupps! Une erreur s'est produite", context);
    });
  }

  getprescription() async {
    await httpGlobalDatasource.getprescription(id: examId).then((data) {
      setState(() {
        _prescriptionList = data;
        print("======LENGTH ${_prescriptionList.length}=======");
      });
    }).catchError((err) {
      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  getexamen() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

    await httpGlobalDatasource.getexamenprescription().then((data) {
      Navigator.of(context).pop();
      setState(() {
        _examenList = data;
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
