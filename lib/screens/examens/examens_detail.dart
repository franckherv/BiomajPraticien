// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/list_exam.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExamenDetailScreen extends StatefulWidget {
  ListExam examId;

  ExamenDetailScreen({super.key, required this.examId});

  @override
  State<ExamenDetailScreen> createState() => _ExamenDetailScreenState();
}

class _ExamenDetailScreenState extends State<ExamenDetailScreen> {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          createExamens(statut: "2");
        },
        icon: const Icon(Icons.save),
        label: const Text("Enrégistrer"),
      ),
      appBar: appBarmenu(
          context: context,
          title: "Détail examens",
          bgClr: Colors.white,
          color: Colors.black,
          elevation: 0),
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
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setHeight(15),
              vertical: ScreenUtil().setHeight(10)),
          child: ListView(
            children: [
              Column(
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
                          title: const Text(
                            'Date',
                          ),
                        trailing:  Text(CommonVariable.ddMMYYFormat.format(widget.examId.createdAt ?? DateTime.now())),
                        ),
                           ListTile(
                          title: const Text(
                            'Heure',
                          ),
                        trailing:  Text(CommonVariable.hhMMFormat.format(widget.examId.createdAt ?? DateTime.now())),
                        ),
                        ListTile(
                          title: const Text(
                            'Type d\'examens',
                          ),
                          trailing: Text(widget
                              .examId.typeExam!.libelletypeexamen.toString()),
                        ),
                        ListTile(
                          title: const Text(
                            'Examens démandé',
                          ), 
                          trailing:
                              Text(widget.examId.examendemande.toString()),
                        ),
                          ListTile(
                          title: const Text(
                            'Matricule patient',
                          ), 
                          trailing:
                              Text(widget.examId.patient!.matriculeuser.toString()),
                        ),
                      /*  ListTile(
                            title: const Text(
                              'Statut de l\'analyse',
                            ),
                            trailing: Chip(
                                label: Text(
                                  widget.examId.etat?.libelleetat ?? "",
                                ),
                                backgroundColor:
                                    widget.examId.stat!.color(),
                                labelStyle:
                                    const TextStyle(color: Colors.white))), */
                            ListTile(
                          title: const Text(
                            'Nom patient',
                          ), 
                          trailing:
                              Text("${widget.examId.patient?.nomuser} ${widget.examId.patient?.prenomuser}"),),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          title: const Text("Description"),
                          subtitle: widget.examId.descriptionanalyse != null
                              ? Text(widget.examId.descriptionanalyse!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400))
                              : const Text('Aucune description inscrite',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            
            ],
          ),
        ),
      ),
    );
  }

  createExamens({String? statut}) async {
    setState(() {
      loadingMessage = "Demande en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .validateAnalyse(id: widget.examId.id, statut: statut)
        .then((datas) {
      Navigator.of(context).pop();
      if (datas["code"] == 1) {
        displayToastmessage("Enrégistrement éffectué avec succeès !", context);

        Navigator.of(context).pushNamedAndRemoveUntil(
          '/succes-appointement',
          (Route<dynamic> route) => false,
        );
      }
    }).catchError((err, error) {
      displayToastmessage("Oupps! Une erreur s'est produite", context);
    });
  }


  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }


}
