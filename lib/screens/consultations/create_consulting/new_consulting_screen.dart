// ignore_for_file: prefer_if_null_operators

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

import '../../../models/hopital_model.dart';
import '../../../models/medecin_model.dart';
import '../../../models/service_list.dart';

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

  List<Hopital> _hospitalList = [];
  List<MedecinModel> _medcinList = [];
  List<ServiceData> _serviceList = [];
  var _curentactivity;
  var _curentservice;
  var _curentmedecin;
  String? _hospitalID;
  String? serviceID;
  String? medecinId;


  @override
  void initState() {
  Future.delayed(const Duration(milliseconds: 0), () {
      getHospitaldata();
    });    super.initState();
  }

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
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: ScreenUtil()
                                                      .setHeight(10),
                                                   top: ScreenUtil()
                                                      .setHeight(10),
                                                ),
                                                child: const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Hôpital",
                                                    style: AppDesign.messervice,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(child: FormField(
                                                    builder:
                                                        (FormFieldState state) {
                                                      return InputDecorator(
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0.0),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 8.0,
                                                                  left: 8.0,
                                                                  right: 10),
                                                        ),
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton<
                                                              Hopital>(
                                                            value: _curentactivity !=
                                                                    null
                                                                ? _curentactivity
                                                                : null,
                                                            iconSize: 30,
                                                            icon: const Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              size: 15,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'MontserratRegular'),
                                                            hint: const Text(
                                                                'Cliquez pour sélectionner'),
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() {
                                                                _curentactivity = newValue;
                                                                _hospitalID = newValue!.id.toString();
                                                                getServiceData();
                                                              });
                                                            },
                                                            items: _hospitalList
                                                                .map((item) {
                                                              return DropdownMenuItem(
                                                                  value: item,
                                                                  child: Text(
                                                                      item
                                                                          .name!,
                                                                      style: const TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              16)));
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
                                                  bottom: ScreenUtil()
                                                      .setHeight(10),
                                                  top: ScreenUtil()
                                                      .setHeight(10),
                                                ),
                                                child: const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Choisir le service",
                                                    style: AppDesign.messervice,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: FormField(
                                                      builder: (FormFieldState
                                                          state) {
                                                        return InputDecorator(
                                                          decoration:
                                                              InputDecoration(
                                                            filled: true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width:
                                                                          0.0),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 8.0,
                                                                    left: 8.0,
                                                                    right: 10),
                                                          ),
                                                          child:
                                                              DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton<
                                                                    ServiceData>(
                                                              iconSize: 30,
                                                              icon: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                size: 15,
                                                                color: _serviceList
                                                                        .isNotEmpty
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .grey,
                                                              ),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'MontserratRegular'),
                                                              hint: _serviceList
                                                                      .isNotEmpty
                                                                  ? const Text(
                                                                      'Cliquez pour sélectionner')
                                                                  : const Text(
                                                                      'Aucun service trouvé'),
                                                              onChanged:
                                                                  (newValue) {
                                                                setState(() {
                                                                  _curentservice =
                                                                      newValue;
                                                                  serviceID =
                                                                      newValue!
                                                                          .id
                                                                          .toString();
                                                                  getDoctorData();
                                                                });
                                                              },
                                                              value: _curentservice !=
                                                                      null
                                                                  ? _curentservice
                                                                  : null,
                                                              items: _serviceList
                                                                  .map((ServiceData
                                                                      item) {
                                                                return DropdownMenuItem(
                                                                    value:
                                                                        item,
                                                                    child: Text(
                                                                        item.service!
                                                                            .name!,
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontSize:
                                                                                16)));
                                                              }).toList(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: ScreenUtil()
                                                      .setHeight(10),
                                                  top: ScreenUtil()
                                                      .setHeight(10),
                                                ),
                                                child: const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Choisir le medecin",
                                                    style: AppDesign.messervice,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: FormField(
                                                      builder: (FormFieldState
                                                          state) {
                                                        return InputDecorator(
                                                          decoration:
                                                              InputDecoration(
                                                            filled: true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width:
                                                                          0.0),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 8.0,
                                                                    left: 8.0,
                                                                    right: 10),
                                                          ),
                                                          child:
                                                              DropdownButtonHideUnderline(
                                                            child: DropdownButton<
                                                                MedecinModel>(
                                                              value: _curentmedecin !=
                                                                      null
                                                                  ? _curentmedecin
                                                                  : null,
                                                              iconSize: 30,
                                                              icon: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                size: 15,
                                                                color: _medcinList
                                                                        .isNotEmpty
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .grey,
                                                              ),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'MontserratRegular'),
                                                              hint: _medcinList
                                                                      .isNotEmpty
                                                                  ? const Text(
                                                                      'Cliquez pour sélectionner')
                                                                  : const Text(
                                                                      'Aucun medecin disponible'),
                                                              onChanged:
                                                                  (newValue) {
                                                                setState(() {
                                                                  _curentmedecin =
                                                                      newValue;
                                                                  medecinId =
                                                                      newValue!
                                                                          .id
                                                                          .toString();
                                                                });
                                                              },
                                                              items: _medcinList
                                                                  .map((MedecinModel
                                                                      item) {
                                                                return DropdownMenuItem(
                                                                    value:
                                                                        item,
                                                                    child: Text(
                                                                        "${item.medecin!.nomuser!} ${item.medecin!.prenomuser}",
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontSize:
                                                                                16)));
                                                              }).toList(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(30),
                                        ),
                                      ],
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
            matriculeuser: matriculeController.text,
            medecinId: medecinId
            )
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

  getServiceData() async {
    await httpGlobalDatasource.getService(hopitalId: _hospitalID).then((data) {
      setState(() {
        _serviceList = data;
      });
    }).catchError((err) {
      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  getHospitaldata() async {
    await httpGlobalDatasource.getHospital().then((data) {
      setState(() {
        _hospitalList = data;
      });
    }).catchError((err) {
      print("**err**$err********");

      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  getDoctorData() async {
    await httpGlobalDatasource
        .getDoctorList(hopitalId: _hospitalID, serviceId: serviceID)
        .then((data) {
      setState(() {
        _medcinList = data;
      });
    }).catchError((err) {
      displayToastmessage("Oupps! une erreur s'est produite", context);
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
