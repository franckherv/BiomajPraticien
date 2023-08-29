// import 'package:biomaj/constants/appBar.dart';
// import 'package:biomaj/constants/app_images.dart';
// import 'package:biomaj/datasources/http_global_datasource.dart';
// import 'package:biomaj/models/list_exam.dart';
// import 'package:biomaj/screens/examens/showexam/show_exam_widget.dart';
// import 'package:biomaj/widgets/drawer_menu/drawer_menu.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ShowExamenbytF extends StatefulWidget {

//     var examlist;

//    ShowExamenbytF({Key? key,required this.examlist}) : super(key: key);

//   @override
//   State<ShowExamenbytF> createState() => _ShowExamenbytFState();
// }

// class _ShowExamenbytFState extends State<ShowExamenbytF> {
//   TextEditingController controller = TextEditingController();

//   HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
//   final GlobalKey<State> _keyLoader = GlobalKey<State>();
//   String loadingMessage = "Patientez svp";


//   List<Examencours> _examenEncours = [];

//   @override
//   void initState() {
   
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawermenu(),
//       backgroundColor: Colors.white,
//       appBar: appBarmenu(
//           context: context,
//           title: "Analyses en cours",
//           bgClr: Colors.white,
//           color: Colors.black,
//           elevation: 0),
//       body: Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage(
//                     AppImages.fontdecran,
//                   ),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: ScreenUtil().setHeight(15),
//                     vertical: ScreenUtil().setHeight(10)),
//                 child: ListView.builder(
//                   padding: const EdgeInsets.only(top: 10),
//                   itemCount: widget.examlist.
//                   itemBuilder: (context, index) {
//                     return ShowTextExamWidget(
//                       examlist: _examenEncours[index],
//                     );
//                   },
//                 ),
//               ),
//             )
//           : Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage(
//                     AppImages.fontdecran,
//                   ),
//                 ),
//               ),
//               child: const Center(
//                 child: Text("Vide"),
//               )),
//     );
//   }






// }
