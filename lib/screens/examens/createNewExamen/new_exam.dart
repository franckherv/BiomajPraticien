// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/utils/rounded_text_input_field_with_border.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

import '../../../main.dart';

class NewExam extends StatefulWidget {
 NewExam({ Key? key}) : super(key: key);

  @override
  State<NewExam> createState() => _NewExamState();
}

class _NewExamState extends State<NewExam> {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameExamCobtroller = TextEditingController();
  final TextEditingController numberCobtroller = TextEditingController();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();

  String loadingMessage = "Patientez svp";
  var data ;
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
 

  @override
  void initState() {
    super.initState();
    openBox();
  }


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
            title: const Text("Création d'examen", style: TextStyle(color: Colors.black),),
             leading: IconButton(
      icon: const ImageIcon(
        AssetImage(AppImages.backButton),
        color: Colors.black,
      ),
      onPressed: () => {
        Navigator.of(context).pop()
        },
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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Column(
                                    children: [
                                     
                            
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(5),
                                          top: ScreenUtil().setHeight(10),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Nom de l'examen",
                                            style: AppDesign.messervice,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(5),
                                          //  top: 50.0,
                                        ),
                                        child:RoundedTextInputFieldWithBorder(
                                          label: "Cliquez pour saisir",
                                          imputCtrl: nameExamCobtroller,
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
                                            "Numero du patient",
                                            style: AppDesign.messervice,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(5),

                                          //  top: 50.0,
                                        ),
                                        child:RoundedTextInputFieldWithBorder(
                                          label: "Cliquez pour saisir",
                                          imputCtrl: numberCobtroller,
                                          maxLines: 1,
                                          inputType: TextInputType.text,
                                          inputAction: TextInputAction.done,
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
        .createNewExam(
            name: nameExamCobtroller.text,
            contact: numberCobtroller.text,
            )
        .then((datas) {
        Navigator.of(context).pop();
      if (datas["code"] == 0) {
        displayToastmessage("${datas["message"]}", context);
       Navigator.of(context).pop();
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
}


