// ignore_for_file: unused_field, sort_child_properties_last

import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/consultation.dart';
import 'package:biomaj/screens/consultations/detail_consulting.dart';
import 'package:biomaj/services_simulation/api_services_simulation.dart';
import 'package:biomaj/widgets/drawer_menu/drawer_menu.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListConsultation extends StatefulWidget {
  const ListConsultation({Key? key}) : super(key: key);

  @override
  State<ListConsultation> createState() => _ListConsultationState();
}

class _ListConsultationState extends State<ListConsultation> {
  TextEditingController controller = TextEditingController();
  final ApiServiceSimulation _api = ApiServiceSimulation();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";

  List<ListConsultingHospital> _searchResult = [];

  List<ListConsultingHospital> _listconsultation = [];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      getConsultationData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawermenu(),
      backgroundColor: Colors.white,
      appBar: appBarmenu(
          context: context,
          title: "Liste des consultations",
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
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(40)),
              SizedBox(
                // color: Theme.of(context).primaryColor,
                height: ScreenUtil().setHeight(40),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        shadowColor: Colors.grey,
                        child: ListTile(
                          leading: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.only(
                              left: 6, right: 0, top: 0, bottom: 0),
                          visualDensity:
                              const VisualDensity(horizontal: -2, vertical: -4),
                          title: TextField(
                            controller: controller,
                            decoration: const InputDecoration.collapsed(
                              hintText: "Recherche",
                              border: InputBorder.none,
                            ),
                            onChanged: onSearchTextChanged,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: FittedBox(
                            child: SizedBox(
                              height: ScreenUtil().setHeight(40),
                              child: const Row(
                                children: [
                                  Icon(Icons.filter),
                                  SizedBox(width: 5),
                                  Text("Filtre")
                                ],
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              /* 
              
              
              */
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Expanded(
                child: (_listconsultation.isEmpty)
                    ? const Center(
                        child: Center(
                          child: Text("Aucune consultation trouvée"),
                        ),
                      )
                    : _searchResult.isNotEmpty || controller.text.isNotEmpty
                        ? ListView.builder(
                            padding: const EdgeInsets.only(top: 10),
                            itemCount: _searchResult.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      '/detail-consultation-creen',
                                      arguments: DetailConsultationScreen(
                                          consultatingData: _searchResult[i],
                                          selectedPage: 0));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          AppImages.consultation,
                                          width: 25,
                                        ),
                                        title: _searchResult[i].patient != null
                                            ? Text(
                                                "${_searchResult[i].patient!.nomuser} ${_searchResult[i].patient!.prenomuser}",
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            : const SizedBox.shrink(),
                                         subtitle: _searchResult[i].patient != null
                                            ? Text(
                                                "${_searchResult[i].patient!.prenomuser}",
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            : const SizedBox.shrink(),
                                        trailing: Column(
                                          children: [
                                            Text(
                                              CommonVariable.ddMMYYFormat
                                                  .format(DateTime.parse(
                                                      _searchResult[i]
                                                          .createdAt
                                                          .toString())),
                                            ),
                                            Text(
                                              _searchResult[i]
                                                  .getStatus(),
                                              style: TextStyle(color: _searchResult[i].color()),
                                            )
                                          ],
                                        ),
                                      ),
                                      margin: const EdgeInsets.all(0.0),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(top: 10),
                            itemCount: _listconsultation.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      '/detail-consultation-creen',
                                      arguments: DetailConsultationScreen(
                                          consultatingData:
                                              _listconsultation[index],
                                          selectedPage: 0));
                                },
                                child: SizedBox(
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      leading: Image.asset(
                                        AppImages.consultation,
                                        width: 25,
                                      ),
                                      title: _listconsultation[index]
                                                  .patient !=
                                              null
                                          ? Text("${_listconsultation[index].patient!.nomuser}",
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          : const SizedBox.shrink(),
                                         subtitle: _listconsultation[index]
                                                  .patient !=
                                              null
                                          ? Text("${_listconsultation[index].patient!.prenomuser}",
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          : const SizedBox.shrink(),
                                      trailing: Column(
                                        children: [
                                          Text(
                                            CommonVariable.ddMMYYFormat
                                                .format(DateTime.parse(
                                                    _listconsultation[index]
                                                        .createdAt
                                                        .toString())),
                                          ),
                                          Text(
                                            _listconsultation[index]
                                                .getStatus(),
                                            style: TextStyle(color: _listconsultation[index].color()),
                                          )
                                        ],
                                      ),
                                    ),
                                    margin: const EdgeInsets.all(0.0),
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var q in _listconsultation) {
      if (q.patient!.nomuser!.toLowerCase().contains(text) ||
          q.patient!.prenomuser!.contains(text)) {
        _searchResult.add(q);
      }
    }

    setState(() {});
  }

  getConsultationData() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

    await httpGlobalDatasource.getConsultingList().then((data) {
      Navigator.of(context).pop();
      setState(() {
        _listconsultation = data;
      });
    }).catchError((err) {
      print("====>  $err");
      Navigator.of(context).pop();

      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
