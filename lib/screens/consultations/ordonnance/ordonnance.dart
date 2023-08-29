// ignore_for_file: must_be_immutable, unused_field

import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/screens/consultations/ordonnance/creation_ordonnance.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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



  int num = 0;
 

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        getConsultationData();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
final findOrdonnanceById = _listconsultation.firstWhere((element) => element.id == widget.consultatingData!.id, 
      orElse: () => ListConsultingHospital(affichageconsultation: "", analise: [], odornance: []));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.of(context).pushNamed('/creation-ordonnance-enregistrement', arguments: CreationOrdonnance(cnsulID: widget.consultatingData!.codeconsultation));

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
                  child:  RefreshIndicator(
                        onRefresh: ()async{
                          getConsultationData();
                        },
                        child: findOrdonnanceById.odornance.isNotEmpty
                      ? ListView.builder(
                            itemCount: findOrdonnanceById.odornance.length,
                            itemBuilder: (BuildContext context, int i) {
                              return Dismissible(
                               // key: UniqueKey(),
                               key: Key(findOrdonnanceById.odornance[i].toString()),
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
                                              'Voulez-vous vraiment supprimer cette ordonnance?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(true);
                                               setState(() {
                                                  suprimerOrdonnance(
                                                    ordId: findOrdonnanceById.odornance[i].id);
                                               });
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
                                              'Date'
                                            ),
                                            trailing: Text(CommonVariable
                                                .ddMMYYFormat
                                                .format(DateTime.parse(findOrdonnanceById.odornance[i]
                                                    .createdAt
                                                    .toString()))),
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
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.w400))
                                             
                                          ),
                                        ],
                                      ),
                                    ),
                                  
                                  ],
                                ),
                              );
                            }) : const Center(
                          child: Text(
                            "Aucune ordonnance trouvée!",
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
}
