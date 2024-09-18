// ignore_for_file: body_might_complete_normally_nullable

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/screens/common/bottom_tab/add_bottom_appbar.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SiginScreen extends StatefulWidget {
  const SiginScreen({Key? key}) : super(key: key);

  @override
  State<SiginScreen> createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController telEditingcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String loadingMessage = "Connexion en cours";

  String initialCountry = 'CI';
  PhoneNumber number = PhoneNumber(isoCode: 'CI');
  String? phoneNumber;
  RegExp regExp = RegExp(r'^((/[0-9]{2,4}|\+[0-9]{2,4}|\(\+?[0-9]{2,4}\)) ?)');

  bool _isChecked = false;

  bool _isHidden = true;

  Box? box1;

  @override
  void initState() {
    createBox();
    super.initState();
  }
  void createBox() async {
    box1 = await Hive.openBox('logindata');
    getdata();
  }

  void getdata() async {
    if (box1!.get('contact') != null) {
      telEditingcontroller.text = box1!.get('contact');
      _isChecked = true;
      setState(() {});
    }
    if (box1!.get('password') != null) {
      passwordController.text = box1!.get('password');
      _isChecked = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: const Text("Connexion", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        // leading: InkWell(
        //   child: const Icon(Icons.arrow_back_ios_new_outlined),
        //   onTap: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
      
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.fontdecran,
            ),
          ),
        ),
        child: Column(
          children: [
         
            //  SizedBox(height: ScreenUtil().setHeight(20),),
            Expanded(
              flex: 3,
              child: SizedBox(
                child: Image.asset(
                  AppImages.undraw1,
                  width: 200.0,
                  height: 200.0,
                ),
              ),
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
                      color: Colors.black,
                      spreadRadius: 0.5,
                      blurRadius: 16,
                      offset: Offset(0.7, 0.7),
                    ),
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(30.h),
                          child: Column(
                           
                            children: <Widget>[
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 10.h, bottom: 5.h),
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Numéro de téléphone"),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(0),
                                      color: Colors.white,
                                    ),
                                    child: InternationalPhoneNumberInput(
                                      onInputChanged: (PhoneNumber number) {
                                        //print(str.substring(startIndex + start.length, endIndex));
            
                                        phoneNumber = number.phoneNumber;
                                      },
                                      onInputValidated: (bool value) {
                                        //print(value);
                                      },
                                      selectorConfig: const SelectorConfig(
                                        selectorType: PhoneInputSelectorType
                                            .BOTTOM_SHEET,
                                      ),
                                      ignoreBlank: false,
                                      countries: const ['CI'],
                                      autoValidateMode: AutovalidateMode.disabled,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      selectorTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      initialValue: number,
                                      textFieldController: telEditingcontroller,
                                      maxLength: 10,
                                      formatInput: false,
                                      keyboardType: const TextInputType
                                              .numberWithOptions(
                                          signed: true, decimal: true),
                                      inputDecoration:
                                          const InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.edit_outlined,
                                        ),
                                        border: InputBorder.none,
                                        isDense: false,
                                        labelStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                           ),
                                        hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15,
                                           ),
                                      ),
                                      onSubmit: () {},
                                    ),
                                  ),
                                  
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 10.h,
                                      top: 10.h,
                                    ),
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Mot de passe"),
                                    ),
                                  ),
                                  TextFormField(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    obscureText: "Password" == "Password"
                                        ? _isHidden
                                        : false,
                                    controller: passwordController,
                                    textInputAction: TextInputAction.done,
                                    onEditingComplete: () =>
                                        FocusScope.of(context).nextFocus(),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Veuillez entrer un mot de passe valide";
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'calibriRegular'),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintStyle: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontFamily: 'MontserratRegular'),
                                      contentPadding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, left: 8.0),
                                      prefixIcon: const Icon(
                                        Icons.vpn_key,
                                        color: Colors.grey,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isHidden = !_isHidden;
                                          });
                                        },
                                        icon: _isHidden
                                            ? const Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              )
                                            : const Icon(
                                                Icons.visibility,
                                                color: Colors.grey,
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                           
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 25.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 45.0,
                                  child: SmallRaisedBtn(
                                    width: double.infinity,
                                    onPressed: () {
            
                                       if (((telEditingcontroller.text
                                                      .startsWith("07") ==
                                                  true) ||
                                              (telEditingcontroller.text
                                                      .startsWith("01") ==
                                                  true) ||
                                              (telEditingcontroller.text
                                                      .startsWith("05") ==
                                                  true)) &&
                                          passwordController.text.isNotEmpty) {
                                        login();
                                      } else {
                                        print("====${telEditingcontroller.text.startsWith("07")}====");
            
                                        displayToastmessage(
                                            "Veuillez remplir correctement tous les formulaires.",
                                            context);
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Text(
                                      "Connexion",
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
                ),
              ),
            )
         
          ],
        ),
      ),
    );
  }

  login() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    // Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();

    await httpGlobalDatasource
        .connexion(
            contact: telEditingcontroller.text,
            password: passwordController.text)
        .then((response) {
      if ((response != null &&
              response["code"] != null &&
              response["code"] == "1") ||
          (response != null &&
              response["code"] != null &&
              response["code"] == 1)) {
        if (_isChecked) {
          box1!.put("contact", telEditingcontroller.value.text);
          box1!.put("password", passwordController.value.text);
        }
        box1!.put('name', response["donne"]["user"]['nomuser']);
        box1!.put('prenom', response["donne"]["user"]['prenomuser']);
        box1!.put('lienimageuser', response["donne"]["user"]['lienimageuser']);
        box1!.put('contact', response["donne"]["user"]['contact1user']);
        box1!.put('matricule', response["donne"]["user"]['matriculeuser']);
        box1!.put('email', response["donne"]["user"]['email']);
        box1!.put('token', response["donne"]['access_token']);

        CommonVariable.userTken = box1?.get('token');

        box1!.put('isLogged', true);

        Navigator.of(context).pushNamedAndRemoveUntil(
            '/shared_bottom_app_bar', (Route<dynamic> route) => false,
            arguments: SharedBottomAppBar(
              defauldIndex: 0,
            ));
      } else if (response["code"] == 2 || response["code"] == 0) {
        displayToastmessage("${response["message"]}", context);
        Navigator.of(context).pop();
      } else {
        displayToastmessage("Contact ou mot de passe incorrect", context);
        Navigator.of(context).pop();
      }
    }).catchError((err) {
      print("====Nos===ERREUR=${err}=========");

      displayToastmessage("Oupps ! Une erreur s'est produite", context);
      Navigator.of(context).pop();
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
