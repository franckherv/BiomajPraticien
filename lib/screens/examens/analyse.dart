import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/list_exam.dart';
import 'package:biomaj/screens/examens/examens_list_screen.dart';
import 'package:biomaj/screens/examens/examens_list_widget.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:biomaj/widgets/drawer_menu/drawer_menu.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnalysePrescriteScreen extends StatefulWidget {
  const AnalysePrescriteScreen({Key? key}) : super(key: key);

  @override
  State<AnalysePrescriteScreen> createState() => _AnalysePrescriteScreenState();
}

class _AnalysePrescriteScreenState extends State<AnalysePrescriteScreen> {
  TextEditingController controller = TextEditingController();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";

  String barcode = "";

  List<ListExam> _examList = [];

  @override
  void initState() {
    // _analyseprescrite = _api.getanalysePrescriteList(fake: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawermenu(),
      backgroundColor: Colors.white,
      appBar: appBarmenu(
          context: context,
          title: _examList.isNotEmpty ? "Liste d'examen": "Analyses prescrites",
          bgClr: Colors.white,
          color: Colors.black,
          elevation: 0),
      body: _examList.isNotEmpty ? Container(
              width: double.infinity,
              decoration: const BoxDecoration(
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
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: _examList.length,
                  itemBuilder: (context, index) {
                    return ExamenListWidget(
                      examlist: _examList[index],
                    );
                  },
                ),
              ),
            ):
      
       Container(
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
              flex: 2,
              child: SizedBox(
                height: ScreenUtil().setHeight(40),
                child: Image.asset(
                  AppImages.analyseLogo,
                  width: 250.0,
                  height: 200.0,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
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
                      color: Colors.grey,
                      spreadRadius: 0.1,
                      blurRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setHeight(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            // color: Theme.of(context).primaryColor,
                            height: ScreenUtil().setHeight(60),

                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: SizedBox(
                                     height: ScreenUtil().setHeight(50),
                                    child: Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      shadowColor: Colors.grey,
                                      child: ListTile(
                                        leading: const Icon(Icons.search),
                                        contentPadding: const EdgeInsets.only(
                                            left: 10, right: 0, top: 8, bottom: 0),
                                        visualDensity: const VisualDensity(
                                            horizontal: -2, vertical: -4),
                                        title: TextField(
                                          controller: controller,
                                          decoration:
                                              const InputDecoration.collapsed(
                                            hintText: "Recherche",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(40),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              width: double.infinity,
                              height: 45.0,
                              child: SmallRaisedBtn(
                                width: double.infinity,
                                onPressed: () {
                                  scan();
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: const Text(
                                  "Scanner le QRcode",
                                  style: AppDesign.rstpwdstyle,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              width: double.infinity,
                              height: 45.0,
                              child: SmallRaisedBtn(
                                width: double.infinity,
                                onPressed: () {

                                  if (barcode.isNotEmpty && controller.text.isNotEmpty ) {
                                    Navigator.of(context).pushNamed(
                                        '/list-examens-screen',
                                        arguments: ListExamensScreen(
                                            examData: barcode)); 
                                  } else if (barcode.isEmpty && controller.text.isNotEmpty ) {
                                    postExammenList(); 
                        print("text field============ ${controller.text}==========");
                                    
                                  } else { 
                                    displayToastmessage(
                                        "Veuillez Scanner le Qr code du patient ou renseigner le champ",
                                        context);
                                  }
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: const Text(
                                  "Réchercher",
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
            )
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      await BarcodeScanner.scan().then((value) {
        setState(() {
          barcode = value.rawContent.toString();
        });

        if (barcode.isNotEmpty) {
          setState(() {
            controller.text = barcode;

          });
        }
      });
      //  setState(() => barcode = value.rawContent.toString());
      // if (barcode != "") {

      // }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => barcode = 'Unknown error: $e');
    }
  }

  postExammenList() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

    await httpGlobalDatasource
        .examenList(
             code: controller.text
          //  code: "63cfe14da6a69"
            )
        .then((data) {
      Navigator.of(context).pop();
      setState(() {
        _examList = data;

//Navigator.pushNamed(context, "/show-examenbytF", arguments: ShowExamenbytF(examlist: _examList) );   
  }
);
    }).catchError((err) {
      Navigator.of(context).pop();
      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
