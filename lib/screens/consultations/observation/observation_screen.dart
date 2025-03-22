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


class ObservationScreen extends StatefulWidget {
  ListConsultingHospital? consultatingData;

  ObservationScreen({Key? key, this.consultatingData}) : super(key: key);

  @override
  State<ObservationScreen> createState() => _ObservationScreenState();
}

class _ObservationScreenState extends State<ObservationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController descontroller = TextEditingController();
  final TextEditingController codeCsltController = TextEditingController();
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";
  List<ListConsultingHospital> _listconsultation = [];

  bool isVisible = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      getConsultationData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final findObservationById = _listconsultation.firstWhere(
        (element) => element.id == widget.consultatingData!.id,
        orElse: () => ListConsultingHospital(
            affichageconsultation: "", analise: [], odornance: []));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return StatefulBuilder(builder: (BuildContext context,
                    StateSetter setState) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    color: const Color(0xFF737373),
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              AppImages.fontdecran,
                            ),
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(
                            ScreenUtil().setHeight(20),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: ScreenUtil().setHeight(10),
                                  top: ScreenUtil().setHeight(10),
                                ),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Description"),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(5),

                                  //  top: 50.0,
                                ),
                                child: RoundedTextInputFieldWithBorder(
                                  label: "Cliquez pour saisir",
                                  imputCtrl: descontroller,
                                  maxLines: 3,
                                  inputType: TextInputType.multiline,
                                  inputAction: TextInputAction.newline,
                                  textColor: Colors.black54,
                                  inputColor: Colors.black54,
                                  tailText: 15,
                                  obscure: false,
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
                                        if (descontroller.text.isNotEmpty) {
                                          createNewObservation();

                                          // controller.addObservation(widget.consultatingData!.codeconsultation.toString());
                                        } else {
                                          displayToastmessage(
                                              "Veuillez renseigner correctement tous les champs",
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
                      ),
                    ),
                  );
                });
              });
        },
        child: const Icon(Icons.add),
      ),
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
        child: findObservationById.description != null
            ? Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Card(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // margin: EdgeInsets.all(20.0),
                    child: ListTile(
                        title: const Text('Observation'),
                        subtitle: Text(findObservationById.description.toString())),
                  ),
                ],
              )
            : Center(
                child: Padding(
                  padding: EdgeInsets.all(15.h),
                  child: const Text(
                    "Aucune observation trouvée.",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  createNewObservation() async {
    setState(() {
      loadingMessage = "Demande en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .createObservation(
            description: descontroller.text,
            codeconsultation: widget.consultatingData!.codeconsultation)
        .then((datas) {
      Navigator.of(context).pop();
      if (datas["code"] == 1) {
        Future.delayed(const Duration(milliseconds: 0), () {
          getConsultationData();
        });
        displayToastmessage("Enrégistrement éffectué avec succeès !", context);

        Navigator.of(context).pop();
      }
    }).catchError((err, error) {
      displayToastmessage("Oupps! Une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
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
}
