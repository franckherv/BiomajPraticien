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
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:intl/intl.dart';

class NewConsultingScreen extends StatefulWidget {
  const NewConsultingScreen({Key? key}) : super(key: key);

  @override
  State<NewConsultingScreen> createState() => _NewConsultingScreenState();
}

class _NewConsultingScreenState extends State<NewConsultingScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController tensioncontroller = TextEditingController();
  final TextEditingController poidController = TextEditingController();
  final TextEditingController tempController = TextEditingController();
  final TextEditingController rythmCarController = TextEditingController();
  final TextEditingController matriculeController = TextEditingController();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String loadingMessage = "Patientez svp";

  String barcode = "";

  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Expanded(
              flex: 4,
              child: Container(
                // height: 300,
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
                      color: Colors.grey,
                      spreadRadius: 0.1,
                      blurRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    ),
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(
                            ScreenUtil().setHeight(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Column(
                                  children: [
                                       Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Matricule"),
                                        IconButton(
                                            color: Colors.green,
                                            onPressed: () {
                                              scan();
                                            },
                                            icon: const Icon(Icons.qr_code))
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(5),

                                        //  top: 50.0,
                                      ),
                                      child: RoundedTextInputFieldWithBorder(
                                        label: "Cliquez pour saisir",
                                        imputCtrl: matriculeController,
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
                                        bottom: ScreenUtil().setHeight(10),
                                        top: ScreenUtil().setHeight(10),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Tension"),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(5),

                                        //  top: 50.0,
                                      ),
                                      child: RoundedTextInputFieldWithBorder(
                                        label: "Cliquez pour saisir",
                                        imputCtrl: tensioncontroller,
                                        inputType: TextInputType.text,
                                        inputAction: TextInputAction.next,
                                        textColor: Colors.black54,
                                        inputColor: Colors.black54,
                                        tailText: 15,
                                        obscure: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(10),
                                        top: ScreenUtil().setHeight(10),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Température"),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(5),

                                        //  top: 50.0,
                                      ),
                                      child: RoundedTextInputFieldWithBorder(
                                        label: "Cliquez pour saisir",
                                        imputCtrl: tempController,
                                        inputType: TextInputType.number,
                                        inputAction: TextInputAction.next,
                                        textColor: Colors.black54,
                                        inputColor: Colors.black54,
                                        tailText: 15,
                                        obscure: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(10),
                                        top: ScreenUtil().setHeight(10),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Poids"),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(5),

                                        //  top: 50.0,
                                      ),
                                      child: RoundedTextInputFieldWithBorder(
                                        label: "Cliquez pour saisir",
                                        imputCtrl: poidController,
                                        inputType: TextInputType.number,
                                        inputAction: TextInputAction.next,
                                        textColor: Colors.black54,
                                        inputColor: Colors.black54,
                                        tailText: 15,
                                        obscure: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: ScreenUtil().setHeight(10),
                                        top: ScreenUtil().setHeight(10),
                                      ),
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Rythme cardiaque"),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(5),

                                        //  top: 50.0,
                                      ),
                                      child: RoundedTextInputFieldWithBorder(
                                        label: "Cliquez pour saisir",
                                        imputCtrl: rythmCarController,
                                        inputType: TextInputType.number,
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
                              SizedBox(
                                height: ScreenUtil().setHeight(30),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 45.0,
                                  child: SmallRaisedBtn(
                                    width: double.infinity,
                                    onPressed: () {
                                      setState(() {
                                        if (tempController.text.isNotEmpty &&
                                            tensioncontroller.text.isNotEmpty &&
                                            poidController.text.isNotEmpty &&
                                            rythmCarController
                                                .text.isNotEmpty &&
                                            matriculeController
                                                .text.isNotEmpty) {
                                          createNewConsultation();
                                        } else {
                                          displayToastmessage(
                                              "Veuillez remplir correctement tous les champs",
                                              context);
                                        }
                                      });
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
              ),
            )
          ],
        ),
      ),
    );
  }

  createNewConsultation() async {
    setState(() {
      loadingMessage = "Demande en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .createConsultation(
            tension: tensioncontroller.text,
            poids: poidController.text,
            temperature: tempController.text,
            rythmecardiaque: rythmCarController.text,
            matriculeuser: matriculeController.text)
        .then((datas) {
      Navigator.of(context).pop();
      if (datas["code"] == 1) {
        displayToastmessage("Enrégistrement éffectué avec succeès !", context);

        Navigator.of(context).pushNamedAndRemoveUntil(
          '/succes-appointement',
          (Route<dynamic> route) => false,
        );
      }
      if (datas["code"] == 0) {
        displayToastmessage("Oupps! ${datas["message"]}", context);
      }
    }).catchError((err, error) {
      Navigator.of(context).pop();

      displayToastmessage("Oupps! Une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }

  Future scan() async {
    try {
      await BarcodeScanner.scan().then((value) {
        setState(() {
          barcode = value.rawContent.toString();
        });

        if (barcode.isNotEmpty) {
          matriculeController.text = barcode;
        }
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => barcode = 'Unknown error: $e');
    }
  }
}
