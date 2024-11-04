// ignore_for_file: must_be_immutable, unused_field

import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/app_style.dart';
import '../../../utils/rounded_text_input_field_with_border.dart';
import '../../../utils/small_raised_btn.dart';

class OrdonnanceScreen extends StatefulWidget {
  ListConsultingHospital? consultatingData;

  OrdonnanceScreen({Key? key, this.consultatingData}) : super(key: key);

  @override
  State<OrdonnanceScreen> createState() => _OrdonnanceScreenState();
}

class _OrdonnanceScreenState extends State<OrdonnanceScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController descontroller = TextEditingController();
  final TextEditingController codeCsltController = TextEditingController();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";

  bool change = false;

  List<ListConsultingHospital> _listconsultation = [];
  List<Widget> bodyElements = [];
  var controler = <TextEditingController>[];

  final TextEditingController descriptionController = TextEditingController();

  int num = 0;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      getConsultationData();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final findOrdonnanceById = _listconsultation.firstWhere(
        (element) => element.id == widget.consultatingData?.id,
        orElse: () => ListConsultingHospital(
            affichageconsultation: "", analise: [], odornance: []));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pushNamed('/creation-ordonnance-enregistrement',
          //     arguments: CreationOrdonnance(cnsulID: findOrdonnanceById.codeconsultation));

          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.8,
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
                  );
                });
              });
        },
        child: const Icon(Icons.add),
        //: const Text("Ajouter"),
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
                    child: findOrdonnanceById.odornance.isNotEmpty
                        ? ListView.builder(
                            itemCount: findOrdonnanceById.odornance.length,
                            itemBuilder: (BuildContext context, int i) {
                              return Dismissible(
                                key: Key(findOrdonnanceById.odornance[i].id
                                    .toString()), // Assurez-vous que chaque ordonnance a un ID unique
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
                                            'Voulez-vous vraiment supprimer cette ordonnance ?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(
                                                  true); // Confirmer la suppression
                                            },
                                            child: const Text('Oui'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(
                                                  false); // Annuler la suppression
                                            },
                                            child: const Text('Non'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                onDismissed: (direction) {
                                  setState(() {
                                    suprimerOrdonnance(
                                        ordId:
                                            findOrdonnanceById.odornance[i].id);
                                    findOrdonnanceById.odornance.removeAt(
                                        i); // Retirer l'ordonnance de la liste
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Ordonnance supprimée'),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Card(
                                      color: Colors.grey[200],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: const Text('Date'),
                                            trailing: Text(
                                              CommonVariable.ddMMYYFormat
                                                  .format(
                                                DateTime.parse(
                                                  findOrdonnanceById
                                                      .odornance[i].createdAt
                                                      .toString(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20),
                                            title: const Text("Description"),
                                            subtitle: Text(
                                              findOrdonnanceById.odornance[i]
                                                  .descriptionordonnance!,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
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
                              "Aucune ordonnance trouvée!",
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

  suprimerOrdonnance({int? ordId}) async {
    setState(() {
      loadingMessage = "Suppression en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .supprimerOrdonnance(ordonnanceId: ordId)
        .then((datas) {
      Navigator.of(context).pop();
      if (datas["code"] == 1) {
        Future.delayed(const Duration(milliseconds: 0), () {
          getConsultationData();
        });
        displayToastmessage("Suppression éffectuée avec succeès !", context);

        //  Navigator.of(context).pop();
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
    }).catchError((err) {
      Navigator.of(context).pop();

      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }

  createNewOrdonnance() async {
    setState(() {
      loadingMessage = "Demande en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .createOrdonnance(
            description: descriptionController.text,
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
}
