// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/controller/change_rdv_statut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/all_rdv.dart';
import '../../models/rdv_stat_model.dart';
import '../../services_simulation/api_services_simulation.dart';
import '../../utils/rounded_text_input_field_with_border.dart';
import '../../utils/small_raised_btn.dart';

class MesrendezvousVueDetail extends StatefulWidget {
  AllRdv detailrdv;
  MesrendezvousVueDetail({required this.detailrdv});

  @override
  State<MesrendezvousVueDetail> createState() => _MesrendezvousVueDetailState();
}

class _MesrendezvousVueDetailState extends State<MesrendezvousVueDetail> {
  final ChangeStatusController _controller = Get.put(ChangeStatusController());
  List<RdvStatusModel> _rdvStatusList = [];

  final ApiServiceSimulation _api = ApiServiceSimulation();
  String? statutId;
  var value1;

  @override
  void initState() {
    _rdvStatusList = _api.statustList(fake: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarmenu(
            context: context,
            title: "Détail du rendez-vous",
            bgClr: Colors.white,
            color: Colors.black,
            elevation: 0),
        body: Column(
          children: [
            Expanded(
              child: Container(
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
                    horizontal: 12.sp,
                    vertical: 10.sp,
                  ),
                  child: ListView(
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
                              trailing: Text(CommonVariable.ddMMYYFormat
                                  .format(widget.detailrdv.dateRdv)),
                            ),
                            ListTile(
                              title: const Text(
                                'Heure',
                              ),
                              trailing: Text(widget.detailrdv.heure.toString()),
                            ),
                            ListTile(
                              title: const Text(
                                'Hôpital',
                              ),
                              trailing: Text(
                                  widget.detailrdv.hopital!.name.toString()),
                            ),
                            ListTile(
                              title: const Text(
                                'Service',
                              ),
                              trailing: Text(
                                  widget.detailrdv.service!.name.toString()),
                            ),
                            ListTile(
                              title: const Text(
                                'Patient',
                              ),
                              subtitle: Text(widget
                                  .detailrdv.patient!.matriculeuser
                                  .toString()),
                              trailing: Text(
                                  "${widget.detailrdv.patient!.nomuser.toString()} ${widget.detailrdv.patient!.prenomuser.toString()}"),
                            ),
                            ListTile(
                              title: const Text(
                                'Statut',
                              ),
                              trailing: Chip(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: -5, horizontal: 5),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  )),
                                  backgroundColor: widget.detailrdv.color(),
                                  label: Text(
                                    widget.detailrdv.statutRdv(),
                                    style: const TextStyle(color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Description du rendez-vous",
                            style: AppDesign.messervice,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // margin: EdgeInsets.all(2widget.detailrdv.id
                        child: widget.detailrdv.observation != null
                            ? Column(
                                children: [
                                  ListTile(
                                    contentPadding: const EdgeInsets.all(20),
                                    title: Text(
                                      "${widget.detailrdv.observation}",
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: double.infinity,
                                height: ScreenUtil().setHeight(100),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text("Pas de note")],
                                ),
                              ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Observation medecin",
                            style: AppDesign.messervice,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // margin: EdgeInsets.all(2widget.detailrdv.id
                        child: widget.detailrdv.observationmedecin != null
                            ? Column(
                                children: [
                                  ListTile(
                                    contentPadding: const EdgeInsets.all(20),
                                    title: Text(
                                      "${widget.detailrdv.observationmedecin}",
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: double.infinity,
                                height: ScreenUtil().setHeight(100),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text("Pas de note")],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all( 20.h),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: SmallRaisedBtn(
                  width: double.infinity,
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
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
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(AppImages.fontdecran))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: ScreenUtil().setHeight(5),
                                  top: ScreenUtil().setHeight(10),
                                ),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Statut",
                                    style: AppDesign.messervice,
                                  ),
                                ),
                              ),
                              FormField<RdvStatusModel>(
                                builder: (FormFieldState state) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 0.0),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 8.0, left: 8.0, right: 10),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                        child: Obx(
                                      () => DropdownButton<RdvStatusModel>(
                                        value: _controller.selectedStatus.value,
                                        iconSize: 30,
                                        icon: const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'MontserratRegular'),
                                        hint: const Text(
                                            'Cliquez pour sélectionner'),
                                        onChanged: (value) {
                                          setState(() {
                                            _controller.selectedStatus.value =
                                                value;
                                            _controller.statutId.value =
                                                value!.id.toString();
                                          });
                                        },
                                        items: _rdvStatusList.isEmpty
                                            ? []
                                            : _rdvStatusList
                                                .map((RdvStatusModel item) {
                                                return DropdownMenuItem<
                                                    RdvStatusModel>(
                                                  value: item,
                                                  child: Text(item.name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16)),
                                                );
                                              }).toList(),
                                      ),
                                    )),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: ScreenUtil().setHeight(5),
                                  top: ScreenUtil().setHeight(10),
                                ),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Remarque",
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
                                  imputCtrl: _controller
                                      .messageEditingController.value,
                                  inputType: TextInputType.multiline,
                                  inputAction: TextInputAction.newline,
                                  textColor: Colors.black54,
                                  inputColor: Colors.black54,
                                  tailText: 15,
                                  obscure: false,
                                  maxLines: 4,
                                ),
                              ),
                              SizedBox(height: 30.h),
                              Obx(() => Visibility(
                                    visible: !_controller.loading.value,
                                    replacement: const Center(
                                        child: CircularProgressIndicator()),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 45.0,
                                        child: SmallRaisedBtn(
                                          width: double.infinity,
                                          onPressed: () {
                                            _controller.changeStatus(
                                                widget.detailrdv.id);
                                          },
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: const Text(
                                            "Enrégistrer",
                                            style: AppDesign.rstpwdstyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      isScrollControlled:
                          true, 
                    );
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: const Text(
                    'Changer le statut du rendez-vous',
                    style: AppDesign.rstpwdstyle,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.sp,
            )
          ],
        ));
  }
}
