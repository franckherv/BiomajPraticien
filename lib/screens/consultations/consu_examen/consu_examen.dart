// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, depend_on_referenced_packages
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';
import '../../../constants/common_variable.dart';
import '../../../utils/rounded_text_input_field_with_border.dart';
import '../../../utils/small_raised_btn.dart';

// ignore: must_be_immutable
class ConsuExamenScreen extends StatefulWidget {
  ListConsultingHospital? consultatingData;

  ConsuExamenScreen({
    Key? key,
    this.consultatingData,
  }) : super(key: key);

  @override
  State<ConsuExamenScreen> createState() => _ConsuExamenScreenState();
}

class _ConsuExamenScreenState extends State<ConsuExamenScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();
  // final TextEditingController descriptionController = TextEditingController();
  final TextEditingController rensengnementClinCtl = TextEditingController();
  final TextEditingController examenDmdController = TextEditingController();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();

  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";
  int? iD;

  List<ExmprMdl> _examenList = [];
  final List<Prescription> _prescriptionList = [];

  List<ListConsultingHospital> _listconsultation = [];

  // ignore: prefer_typing_uninitialized_variables

  var value1;
  String? examId;
  String? serviceID;

  @override
  void initState() {
    if (mounted) {
      setState(() {
        Future.delayed(const Duration(milliseconds: 0), () {
          getConsultationData();
        });
        //
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final findid = _listconsultation.firstWhere(
        (element) => element.id == widget.consultatingData!.id,
        orElse: () => ListConsultingHospital(
            affichageconsultation: "", analise: [], odornance: []));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context).pushNamed('/creation-examen-enregistrement',
            //     arguments: CreationExamen(cnsulID: findid.codeconsultation));

            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
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
                            height: 40,
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
                              ),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: ScreenUtil().setHeight(30),
                                    right: ScreenUtil().setHeight(30),
                                  ),
                                  child: Column(
                                    children: <Widget>[
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
                                                    borderSide:
                                                        const BorderSide(
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
                                                  child:
                                                      DropdownButton<ExmprMdl>(
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
                                                        examId = value!.id
                                                            .toString();
                                                      });
                                                    },
                                                    items: _examenList.isEmpty
                                                        ? []
                                                        : _examenList
                                                            .map((item) {
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: const Text(
                                              "Valider",
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
                          )
                        ],
                      ),
                    );
                  });
                });
          },
          child: const Icon(Icons.add)),
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
                        color: Colors.white,
                        spreadRadius: 0.1,
                        blurRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      ),
                    ],
                  ),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      getConsultationData();
                    },
                    child: findid.analise.isNotEmpty
                        ? ListView.builder(
                            itemCount: /*widget.consultatingData!.analise!.length ??*/
                                findid.analise.length,
                            itemBuilder: (BuildContext context, int i) {
                              return Dismissible(
                                key: Key(
                                    /*widget.consultatingData!.analise![i].hashCode.toString()*/
                                    findid.analise[i].id.hashCode.toString()),
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  color: AppColors.appThemeColor,
                                  child: const Icon(
                                    Icons.delete,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                ),
                                confirmDismiss: (direction) {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Confirmer'),
                                          content: const Text(
                                              'Voulez-vous vraiment supprimer cet examens?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(true);
                                                suprimerExam(
                                                    analyseId:
                                                        findid.analise[i].id);
                                              },
                                              child: const Text('Oui'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(false);
                                              },
                                              child: const Text('Non'),
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Card(
                                      child: Column(
                                        children: [
                                      const Padding(
                                         padding:  EdgeInsets.all(8.0),
                                         child: Text(
                                            "Information analyse",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                       ),
                                          ListTile(
                                            title: const Text("Date"),
                                            trailing: Text(CommonVariable
                                                .ddMMYYFormat
                                                .format(DateTime.parse(findid
                                                    .analise[i].createdAt
                                                    .toString()))),
                                          ),
                                          ListTile(
                                            title: const Text("Heure"),
                                            trailing: Text(CommonVariable
                                                .hhMMFormat
                                                .format(DateTime.parse(findid
                                                    .analise[i].createdAt
                                                    .toString()))),
                                          ),
                                          ListTile(
                                            title: const Text("Type d'examens"),
                                            subtitle:
                                                findid.analise[i].typeExamen !=
                                                        null
                                                    ? Text(findid.analise[i].typeExam!.libelletypeexamen.toString()
                                                        .toString())
                                                    : const SizedBox.shrink(),
                                          ),
                                          ListTile(
                                            title:
                                                const Text("Examens demandé"),
                                            subtitle: Text( findid.analise[i].examendemande
                                                .toString()),
                                          ),
                                          ListTile(
                                            title: const Text(
                                                "Renseignement clinique"),
                                            subtitle: Text(findid.analise[i].renseignementClt
                                                .toString()),
                                          ),
                                          ListTile(
                                            title: const Text("Description"),
                                            subtitle: Text(
                                                "${findid.analise[i].descriptionanalyse}"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  
                                  ],
                                ),
                              );
                            })
                        : const Center(
                            child: Text(
                              "Aucun examens trouvé",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  suprimerExam({int? analyseId}) async {
    setState(() {
      loadingMessage = "Suppression en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .supprimerExam(analyseId: analyseId)
        .then((datas) {
      Navigator.of(context).pop();
      if (datas["code"] == 1) {
        displayToastmessage("Suppression éffectuée avec succeès !", context);

        // Navigator.of(context).pop();
      }
    }).catchError((err, error) {
      Navigator.of(context).pop();

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
      getexamen();
    }).catchError((err) {
      Navigator.of(context).pop();

      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }

  createNewExam() async {
    setState(() {
      loadingMessage = "Demande en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .createExam(
      codeconsultation: widget.consultatingData!.codeconsultation,
      description: descriptionController.text,
      renseignementClt: rensengnementClinCtl.text,
      typeExamen: examId,
      examendemande: examenDmdController.text,
    )
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
      Navigator.of(context).pop();

      displayToastmessage("Oupps! Une erreur s'est produite", context);
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
}
