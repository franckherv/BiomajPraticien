// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, depend_on_referenced_packages
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/screens/consultations/consu_examen/creation_examen.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/common_variable.dart';

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

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";
  int? iD;

  final List<ExmprMdl> _examenList = [];
  final List<Prescription> _prescriptionList = [];

  List<ListConsultingHospital> _listconsultation = [];

  // ignore: prefer_typing_uninitialized_variables
 
  String? examId;
  String? serviceID;

  @override
  void initState() {
    // if (mounted) {
    //   setState(() {
    //     Future.delayed(const Duration(milliseconds: 0), () {
    //       getConsultationData();
    //     });
    //   });
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
final findid = _listconsultation.firstWhere((element) => element.id == widget.consultatingData!.id, 
      orElse: () => ListConsultingHospital(affichageconsultation: "", analise: [], odornance: []));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/creation-examen-enregistrement',arguments: CreationExamen(cnsulID: widget.consultatingData!.codeconsultation));
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
                  child:  RefreshIndicator(
                    onRefresh: () async {
                      getConsultationData();
                    },
                    child: findid.analise.isNotEmpty ? ListView.builder(
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
                                            suprimerExam(analyseId:findid.analise[i].id);
                                          },
                                          child: const Text('Oui'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
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
                                Card(
                                  color: Colors.grey[200],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  // margin: EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: const Text(
                                          'Date',
                                        ),
                                        trailing: Text(
                                            CommonVariable.ddMMYYFormat.format(
                                                DateTime.parse(findid.analise[i]
                                                    .createdAt
                                                    .toString()))),
                                      ),
                                      ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20),
                                        title: const Text("Description"),
                                        subtitle: Text(
                                                findid.analise[i]
                                                    .descriptionanalyse!,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.w400))
                                         
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }): const Center(
                      child: Text(
                        "Aucun examens trouvé",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                  
                  ),
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
    }).catchError((err) {
      Navigator.of(context).pop();

      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
