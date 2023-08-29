// import 'dart:io';
// import 'package:biomaj/constants/appBar.dart';
// import 'package:biomaj/constants/app_images.dart';
// import 'package:biomaj/datasources/http_global_datasource.dart';
// import 'package:biomaj/models/ordonnance.dart';
// import 'package:biomaj/models/ordonnance_model.dart';
// import 'package:biomaj/services_simulation/api_services_simulation.dart';
// import 'package:biomaj/widgets/drawer_menu/drawer_menu.dart';
// import 'package:biomaj/widgets/loading/loading_spinner.dart';
// import 'package:biomaj/widgets/ordonnanceWidget.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'dart:io';
// import 'package:ext_storage/ext_storage.dart';


// class OrdonnanceScreen extends StatefulWidget {
//   const OrdonnanceScreen({Key? key}) : super(key: key);

//   @override
//   State<OrdonnanceScreen> createState() => _OrdonnanceScreenState();
// }

// class _OrdonnanceScreenState extends State<OrdonnanceScreen> {
//   TextEditingController controller = TextEditingController();
//   final ApiServiceSimulation _api = ApiServiceSimulation();

//     HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
//   final GlobalKey<State> _keyLoader = GlobalKey<State>();
//   String loadingMessage = "Patientez svp";

//   // List<ConsultationModel> _rdvList = [];
//  // List<Ordonnance> _rdvList = [];

//   List<Ordonnance> _ordonance = [];


//   @override
//   void initState() {
//    // _ordonance = _api.getOrdonnanceList(fake: true);
//      Future.delayed(const Duration(milliseconds: 0), () {
//       getOrdonnanceData();
//     });
//     super.initState(); 
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawermenu(),
//       backgroundColor: Colors.white,
//       appBar: appBarmenu(
//           context: context,
//           title: "Ordonnances",
//           bgClr: Colors.white,
//           color: Colors.black,
//           elevation: 0),
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage(
//               AppImages.fontdecran,
//             ),
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: ScreenUtil().setHeight(15),
//               vertical: ScreenUtil().setHeight(10)),
//           child: _ordonance.isNotEmpty ? ListView.builder(
//                 padding:  EdgeInsets.only(top: ScreenUtil().setHeight(40),),
//                 itemCount: _ordonance.length,
//                 itemBuilder: (context, index) {
//                   return OrdonnanceWidget(
//                     ordonnance: _ordonance[index],
//                     index: index,
//                     );
//                 },
//               ) :const Center(child:  Text("Vous n'avez pas d'ordonnance"),
//         ),
//       )),
//     );
//   }

//   Future<void> _createPDF() async {
//     PdfDocument document = PdfDocument();
//     document.pages.add();
//     var bytes = document.save();
//     document.dispose();
//     saveAndLaunchFile(bytes, "analyse.pdf");
//   }

//   Future<void> saveAndLaunchFile(var bytes, String fileName) async {
//     final path = (await getExternalStorageDirectory())!.path;
//     final file = File("$path/$fileName");
//     await file.writeAsBytes(bytes, flush: true);
//     OpenFile.open("$path/$fileName");
//   }



//     getOrdonnanceData() async {
//     LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

//     await httpGlobalDatasource.ordonnanceList().then((data) {
//       Navigator.of(context).pop();
//       setState(() { 
//         _ordonance = data;
//       });

//     }).catchError((err) {
//       print("**err**$err********");

//       displayToastmessage("Oupps! une erreur s'est produite", context);
//     });
//   }

//   displayToastmessage(String message, BuildContext context) {
//     Fluttertoast.showToast(msg: message);
//   }
// }
