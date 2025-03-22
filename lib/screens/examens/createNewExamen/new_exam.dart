// // ignore_for_file: must_be_immutable

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/utils/rounded_text_input_field_with_border.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

import '../../../main.dart';
import '../../../models/consultation.dart';

class NewExam extends StatefulWidget {
  NewExam({Key? key}) : super(key: key);

  @override
  State<NewExam> createState() => _NewExamState();
}

class _NewExamState extends State<NewExam> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController rensengnementClinCtl = TextEditingController();
  final TextEditingController examenDmdController = TextEditingController();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final TextEditingController numberCobtroller = TextEditingController();
  final TextEditingController matriculeCobtroller = TextEditingController();
    String codeQR = "";

  String loadingMessage = "Patientez svp";
  var data;
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  List<ExmprMdl> _examenList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      getexamen();
    });
    openBox();
  }

  var value1;
  String? examId;
  String? serviceID;

  void openBox() async {
    box1 = await Hive.openBox('logindata');
    setState(() {});
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
              
               SizedBox(
                height: 10.h,
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
                                                  onChanged: (value) {
                                                    setState(() {
                                                      value1 = value;
                                                      examId =
                                                          value!.id.toString();
                                                    });
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
                                          "Examens demandés",
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
                                        imputCtrl: examenDmdController,
                                        inputType: TextInputType.multiline,
                                        inputAction: TextInputAction.newline,
                                        textColor: Colors.black54,
                                        inputColor: Colors.black54,
                                        tailText: 15,
                                        obscure: false,
                                        maxLines: 3,
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
                                        imputCtrl: rensengnementClinCtl,
                                        maxLines: 3,
                                        inputType: TextInputType.multiline,
                                        inputAction: TextInputAction.newline,
                                        textColor: Colors.black54,
                                        inputColor: Colors.black54,
                                        tailText: 15,
                                        obscure: false,
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(
                                    //     bottom: ScreenUtil().setHeight(5),
                                    //     top: ScreenUtil().setHeight(10),
                                    //   ),
                                    //   child: const Align(
                                    //     alignment: Alignment.centerLeft,
                                    //     child: Text(
                                    //       "Numero de télephone du patient",
                                    //       style: AppDesign.messervice,
                                    //     ),
                                    //   ),
                                    // ),
                               Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Matricule", style: AppDesign.messervice,),
                                        IconButton(
                                            color: Colors.green,
                                            onPressed: () {
                                              scanQR();
                                            },
                                            icon: const Icon(Icons.qr_code))
                                      ],
                                    ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(5),
                                        
                                          ),
                                          child: RoundedTextInputFieldWithBorder(
                                            label: "Cliquez pour saisir",
                                            imputCtrl: matriculeCobtroller,
                                            maxLines: 1,
                                            inputType: TextInputType.text,
                                            inputAction: TextInputAction.done,
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
                                      createNewExam();
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Text(
                                      "Enregistrer",
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
        .createNewExam(
      description: descriptionController.text,
      renseignementClt: rensengnementClinCtl.text,
      typeExamen: examId,
      examendemande: examenDmdController.text,
     // contact: numberCobtroller.text,
      matricule: matriculeCobtroller.text,
    )
        .then((datas) {
      Navigator.of(context).pop();
      if (datas["code"] == 0) {
        displayToastmessage("${datas["message"]}", context);
       // Navigator.of(context).pop();
      }

      Navigator.of(context).pop();
      if (datas["code"] == 1) {
        displayToastmessage("Enrégistrement éffectué avec succeès !", context);
        Navigator.of(context).pop();
      }
    }).catchError((err, error) {
      Navigator.of(context).pop();

      displayToastmessage("Oupps! Une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
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

    Future scanQR() async {
    try {
      await BarcodeScanner.scan().then((value) {
        setState(() {
          codeQR = value.rawContent.toString();
        });

        if (codeQR.isNotEmpty) {
          setState(() {
            matriculeCobtroller.text = codeQR;

          });
        }
      });
      //  setState(() => barcode = value.rawContent.toString());
      // if (barcode != "") {

      // }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          codeQR = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => codeQR = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => codeQR =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => codeQR = 'Unknown error: $e');
    }
  }


}
