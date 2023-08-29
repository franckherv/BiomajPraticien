// ignore_for_file: prefer_final_fields, unused_field

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/app_style.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/commune_list.dart';
import 'package:biomaj/screens/common/bottom_tab/add_bottom_appbar.dart';
import 'package:biomaj/utils/rounded_text_input_field_with_border.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController telEditingcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordConfController = TextEditingController();
  final TextEditingController specialiteController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController employeurController = TextEditingController();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Inscription en cours";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String initialCountry = 'CI';
  PhoneNumber number = PhoneNumber(isoCode: 'CI');
  String? phoneNumber;
  RegExp regExp = RegExp(r'^((/[0-9]{2,4}|\+[0-9]{2,4}|\(\+?[0-9]{2,4}\)) ?)');

  String? gender;
  bool _isHidden = true;

  List<Commune> _commune = [];

  String? communeId;

  bool _isChecked = false;

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
        backgroundColor: Colors.white,
        title: const Text(
          "Inscription",
          style: TextStyle(color: Colors.black),
        ),
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
          //color: Colors.white.withOpacity(0.4),
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
          child: Column(
            children: [
              const Expanded(
                // flex: 1,
                child: SizedBox(
                    // height: ScreenUtil().setHeight(40),
                    // child: Image.asset(
                    //   AppImages.undraw2,
                    //   width: 100.0,
                    //   height: 100.0,
                    // ),
                    ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(0),
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
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(10),
                              right: ScreenUtil().setHeight(30),
                              left: ScreenUtil().setHeight(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10),
                                          top: ScreenUtil().setHeight(10),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Nom"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(5),

                                          //  top: 50.0,
                                        ),
                                        child: RoundedTextInputFieldWithBorder(
                                          label: "Cliquez pour saisir",
                                          imputCtrl: nameController,
                                          inputType: TextInputType.text,
                                          inputAction: TextInputAction.done,
                                          textColor: Colors.black54,
                                          inputColor: Colors.black54,
                                          tailText: 15,
                                          obscure: false,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10),
                                          top: ScreenUtil().setHeight(10),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Prenom"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(5),

                                          //  top: 50.0,
                                        ),
                                        child: RoundedTextInputFieldWithBorder(
                                          label: "Cliquez pour saisir",
                                          imputCtrl: lastnameController,
                                          inputType: TextInputType.text,
                                          inputAction: TextInputAction.done,
                                          textColor: Colors.black54,
                                          inputColor: Colors.black54,
                                          tailText: 15,
                                          obscure: false,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10),
                                          top: ScreenUtil().setHeight(10),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Spécialité"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(5),

                                          //  top: 50.0,
                                        ),
                                        child: RoundedTextInputFieldWithBorder(
                                          label: "Cliquez pour saisir",
                                          imputCtrl: specialiteController,
                                          inputType: TextInputType.text,
                                          inputAction: TextInputAction.done,
                                          textColor: Colors.black54,
                                          inputColor: Colors.black54,
                                          tailText: 15,
                                          obscure: false,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(10),

                                          //  top: 50.0,
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Numero de téléphone"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(10),

                                          //  top: 50.0,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            color: Colors.white,
                                          ),
                                          child: InternationalPhoneNumberInput(
                                            onInputChanged:
                                                (PhoneNumber number) {
                                              //print(str.substring(startIndex + start.length, endIndex));

                                              phoneNumber = number.phoneNumber;
                                            },
                                            onInputValidated: (bool value) {
                                              //print(value);
                                            },
                                            selectorConfig:
                                                const SelectorConfig(
                                              selectorType:
                                                  PhoneInputSelectorType
                                                      .BOTTOM_SHEET,
                                            ),
                                            ignoreBlank: false,
                                            countries: const ['CI'],
                                            autoValidateMode:
                                                AutovalidateMode.disabled,
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            selectorTextStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            initialValue: number,
                                            textFieldController:
                                                telEditingcontroller,
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
                                                  fontFamily:
                                                      'MontserratRegular'),
                                              hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'MontserratRegular'),
                                            ),
                                            onSubmit: () {},
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10),
                                          top: ScreenUtil().setHeight(10),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Email"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(5),

                                          //  top: 50.0,
                                        ),
                                        child: RoundedTextInputFieldWithBorder(
                                          label: "Cliquez pour saisir",
                                          imputCtrl: specialiteController,
                                          inputType: TextInputType.emailAddress,
                                          inputAction: TextInputAction.done,
                                          textColor: Colors.black54,
                                          inputColor: Colors.black54,
                                          tailText: 15,
                                          obscure: false,
                                        ),
                                      ),
                                      /*  Padding(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10),
                                          top: ScreenUtil().setHeight(10),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Créer un mot de passe"),
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
                                    
                                     
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10),
                                          top: ScreenUtil().setHeight(10),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child:
                                              Text("Confirmer le mot de passe"),
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
                                        controller: passwordConfController,
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
                                   
                                    */
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10),
                                          top: ScreenUtil().setHeight(10),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Localisation"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(5),

                                          //  top: 50.0,
                                        ),
                                        child: RoundedTextInputFieldWithBorder(
                                          label: "Cliquez pour saisir",
                                          imputCtrl: locationController,
                                          inputType: TextInputType.text,
                                          inputAction: TextInputAction.done,
                                          textColor: Colors.black54,
                                          inputColor: Colors.black54,
                                          tailText: 15,
                                          obscure: false,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10),
                                          top: ScreenUtil().setHeight(10),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Employeur"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(5),

                                          //  top: 50.0,
                                        ),
                                        child: RoundedTextInputFieldWithBorder(
                                          label: "Cliquez pour saisir",
                                          imputCtrl: employeurController,
                                          inputType: TextInputType.text,
                                          inputAction: TextInputAction.done,
                                          textColor: Colors.black54,
                                          inputColor: Colors.black54,
                                          tailText: 15,
                                          obscure: false,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/shared_bottom_app_bar',
                                                (Route<dynamic> route) => false,
                                                arguments: SharedBottomAppBar(
                                                  defauldIndex: 0,
                                                ));

                                        /*  if (gender != null && passwordController.text.isNotEmpty &&
                                            passwordConfController.text.isNotEmpty &&
                                            nameController.text.isNotEmpty && lastnameController.text.isNotEmpty &&
                                            communeId != null && telEditingcontroller.text.length == 10 && 
                                            telEditingcontroller.text.isNotEmpty && passwordController.text == passwordConfController.text &&
                                            ((telEditingcontroller.text.startsWith("07") ==true ||
                                                telEditingcontroller.text.startsWith("01") == true ||
                                                telEditingcontroller.text.startsWith("05") ==
                                                    true))) {
 
                                          signupUser();
                                        } else {

                                          displayToastmessage(
                                              "Veuillez remplir correctement tous les formulaires.",
                                              context);
                                        }*/
                                      },
                                      borderRadius: BorderRadius.circular(10),
                                      child: const Text(
                                        "Valider",
                                        style: AppDesign.rstpwdstyle,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(30)),
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  const Text("Déjà un compte? "),
                                  const Text(
                                    "Connectez-vous",
                                    style: AppDesign.profilecodeStyle,
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/Sigin-screen',
                                    (Route<dynamic> route) => false);
                              },
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
      ),
    );
  }

  void validateAndSave() {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }


  signupUser() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .signupUser(
            contact: telEditingcontroller.text,
            password: passwordController.text,
            name: nameController.text,
            lastname: lastnameController.text,
            communeId: communeId,
            confirmPassword: passwordConfController.text,
            sexeuser: gender == "Homme" ? "0" : "1")
        .then((response) {
      if ((response != null &&
              response["code"] != null &&
              response["code"] == "1") ||
          (response != null &&
              response["code"] != null &&
              response["code"] == 1)) {
        box1!.put('name', response["donne"]["user"]['nomuser']);
        box1!.put('prenom', response["donne"]["user"]['prenomuser']);
        box1!.put('lienimageuser', response["donne"]["user"]['lienimageuser']);
        box1!.put('contact', response["donne"]["user"]['contact1user']);
        box1!.put('token', response["donne"]['access_token']);
        box1!.put('matricule', response["donne"]["user"]['matriculeuser']);
        box1!.put('email', response["donne"]["user"]['email']);
        CommonVariable.userTken = box1?.get('token');

        box1!.put('isLogged', true);
      }
      //  Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();

      Navigator.of(context).pushNamedAndRemoveUntil(
          '/shared_bottom_app_bar', (Route<dynamic> route) => false,
          arguments: SharedBottomAppBar(
            defauldIndex: 0,
          ));
    }).catchError((err) {
      print("**err**${err}********");
      // Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

      displayToastmessage(
          "Désolé votre numéro ou mot de passe est incorrecte !", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
