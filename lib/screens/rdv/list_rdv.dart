// ignore_for_file: unused_field, sort_child_properties_last

import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/services_simulation/api_services_simulation.dart';
import 'package:biomaj/widgets/drawer_menu/drawer_menu.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/all_rdv.dart';

class ListAllRdv extends StatefulWidget {
  const ListAllRdv({Key? key}) : super(key: key);

  @override
  State<ListAllRdv> createState() => _ListAllRdvState();
}

class _ListAllRdvState extends State<ListAllRdv> {
  TextEditingController controller = TextEditingController();
  final ApiServiceSimulation _api = ApiServiceSimulation();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";

  List<AllRdv> _searchResult = [];

  List<AllRdv> _listRdv = [];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      getRdvData();
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
          title: "Liste des rendez-vous",
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
                child: (_listRdv.isEmpty)
                    ? const Center(
                        child: Center(
                          child: Text("Aucun rendez-vous trouvé"),
                        ),
                      )
                    : _searchResult.isNotEmpty || controller.text.isNotEmpty
                        ? ListView.builder(
                            padding: const EdgeInsets.only(top: 10),
                            itemCount: _searchResult.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                 /* Navigator.of(context).pushNamed(
                                      '/detail-consultation-creen',
                                      arguments: DetailConsultationScreen(
                                          consultatingData: _searchResult[i],
                                          selectedPage: 0)); */
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
                                        trailing: Text(
                                          CommonVariable.ddMMYYFormat.format(
                                              DateTime.parse(_searchResult[i]
                                                  .createdAt
                                                  .toString())),
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
                            itemCount: _listRdv.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                 /* Navigator.of(context).pushNamed(
                                      '/detail-consultation-creen',
                                      arguments: DetailConsultationScreen(
                                          consultatingData:
                                              _listRdv[index],
                                          selectedPage: 0)); */
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
                                        title: _listRdv[index]
                                                    .patient !=
                                                null
                                            ? Text(
                                                "${_listRdv[index].patient!.nomuser} ${_listRdv[index].patient!.prenomuser}",
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            : const SizedBox.shrink(),
                                        trailing: Text(
                                          CommonVariable.ddMMYYFormat.format(
                                              DateTime.parse(
                                                  _listRdv[index]
                                                      .createdAt
                                                      .toString())),
                                        ),
                                      ),
                                      margin: const EdgeInsets.all(0.0),
                                    ),
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

    for (var q in _listRdv) {
      if (q.patient!.nomuser.toLowerCase().contains(text) ||
          q.patient!.prenomuser.contains(text)) {
        _searchResult.add(q);
      }
    }

    setState(() {});
  }

  getRdvData() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

    await httpGlobalDatasource.getRdvList().then((data) {
      Navigator.of(context).pop();
      setState(() {
        _listRdv = data;
      });
    }).catchError((err) {
      Navigator.of(context).pop();
    print(err);
      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
