// import 'dart:io';

// import 'package:biomaj/constants/appBar.dart';
// import 'package:biomaj/constants/app_colors.dart';
// import 'package:biomaj/constants/app_images.dart';
// import 'package:biomaj/models/ordonnance.dart';
// import 'package:dio/dio.dart';
// import 'package:ext_storage/ext_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';

// class DownloaodAndShareOrdon extends StatefulWidget {
//   Ordonnance? ordonnance;
//   DownloaodAndShareOrdon({this.ordonnance});
//   @override
//   State<DownloaodAndShareOrdon> createState() => _DownloaodAndShareOrdonState();
// }

// class _DownloaodAndShareOrdonState extends State<DownloaodAndShareOrdon> {
//   var dio = Dio();
//   bool? permissionGranted;

//   var imageUrl =
//       'https://pspdfkit.com/downloads/pspdfkit-flutter-quickstart-guide.pdf';

//   @override
//   void initState() {
//     _getStoragePermission();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("http://biomaj.net${widget.ordonnance!.lien}");
//     return Scaffold(
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
//         child: Column(
//           children: [
//             SizedBox(
//               height: ScreenUtil().setHeight(20),
//             ),
//             Expanded(
//               flex: 2,
//               child: SizedBox(
//                 height: ScreenUtil().setHeight(40),
//                 child: Image.asset(
//                   AppImages.pdf,
//                   width: 250.0,
//                   height: 200.0,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: ScreenUtil().setHeight(30),
//             ),
//             Expanded(
//               flex: 4,
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                   image: const DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage(
//                       AppImages.fontdecran,
//                     ),
//                   ),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.grey,
//                       spreadRadius: 0.1,
//                       blurRadius: 0.5,
//                       offset: Offset(0.7, 0.7),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: ScreenUtil().setHeight(20),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                             const Align(
//                             alignment: Alignment.centerLeft,
//                          child: Text("Détail", style: TextStyle(fontWeight: FontWeight.bold),),
                            
//                           ), 
//                           SizedBox(height: ScreenUtil().setHeight(10),),
//                          widget.ordonnance!.descriptionordonnance != null ? Text(widget.ordonnance!.descriptionordonnance.toString()): 
//                          SizedBox(
//                           width: double.infinity,
//                           height: ScreenUtil().setHeight(20),
//                           child: const Text("Pas de note")),
//                           SizedBox(height: ScreenUtil().setHeight(20),),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ElevatedButton.icon(
//                               icon: const Icon(
//                                 Icons.cloud_download_sharp,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () async {
//                                 String path = await ExtStorage
//                                     .getExternalStoragePublicDirectory(
//                                         ExtStorage.DIRECTORY_DOWNLOADS);
//                                 //String fullPath = tempDir.path + "/boo2.pdf'";
//                                 String fullPath = "$path/test.pdf";
//                                 print('full path ${fullPath}');

//                                 download2(dio, "http://biomaj.net${widget.ordonnance!.lien}", fullPath);
//                               },
//                               label: const Text(
//                                 "Télecharger",
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.white),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 primary: AppColors.appThemeColor,
//                                 fixedSize: const Size(500, 45),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SizedBox(
//                               child: ElevatedButton.icon(
//                                 icon: const Icon(
//                                   FontAwesomeIcons.telegram,
//                                   color: Colors.white,
//                                 ),
//                                 onPressed: () {},
//                                 label: const Text(
//                                   "Partager",
//                                   style: TextStyle(
//                                       fontSize: 16, color: Colors.white),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   primary: AppColors.appThemeColor,
//                                   fixedSize: const Size(500, 45),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> share() async {
//     await FlutterShare.share(
//         title: "", text: "", linkUrl: "widget.cat.url", chooserTitle: '');
//   }

//   Future _getStoragePermission() async {
//     if (await Permission.storage.request().isGranted) {
//       setState(() {
//         permissionGranted = true;
//       });
//     } else if (await Permission.storage.request().isPermanentlyDenied) {
//       await openAppSettings();
//     } else if (await Permission.storage.request().isDenied) {
//       setState(() {
//         permissionGranted = false;
//       });
//     }
//   }

//   Future download2(Dio dio, var url, String savePath) async {
//     try {
//       Response response = await dio.get(
//         url,
//         onReceiveProgress: showDownloadProgress,
//         //Received data with List<int>
//         options: Options(
//             responseType: ResponseType.bytes,
//             followRedirects: false,
//             validateStatus: (status) {
//               return status! < 500;
//             }),
//       );
//       File file = File(savePath);
//       var raf = file.openSync(mode: FileMode.write);
//       // response.data is List<int> type
//       raf.writeFromSync(response.data);
//       await raf.close();
//     } catch (e) {
//       print(e);
//     }
//   }

//   void showDownloadProgress(received, total) {
//     if (total != -1) {
//       displayToastmessage(
//           (received / total * 100).toStringAsFixed(0) + "%", context);

//       print((received / total * 100).toStringAsFixed(0) + "%");
//     }
//   }

//   displayToastmessage(String message, BuildContext context) {
//     Fluttertoast.showToast(msg: message);
//   }
// }
