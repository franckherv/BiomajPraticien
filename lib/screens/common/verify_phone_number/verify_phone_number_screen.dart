// ignore_for_file: must_be_immutable, unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class VerifyPhoneNumberScreen extends StatefulWidget {
  String phone;
  String verificationId;

  VerifyPhoneNumberScreen(
      {required this.phone, required this.verificationId});

  @override
  _VerifyPhoneNumberScreenState createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  //var onTapRecognizer;

  TextEditingController codeEditingController = TextEditingController();

  late StreamController<ErrorAnimationType> errorController;

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  String loadingMessage = "Vérification en cours ...";

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    /*onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        print("Envoie de code ##########");
      };*/
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container()
      
      /*Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 10.0),
                  //   child: Image.asset(
                  //     AppImages.appLogoPng,
                  //     fit: BoxFit.contain,
                  //     width: 100.0,
                  //     height: 100,
                  //     //color: Colors.white,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Validation",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'MontserratBold',
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 8,
                ),
                child: RichText(
                  text: TextSpan(
                    text:
                        "Veuillez saisir le code de validation envoyer par SMS au: ",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'MontserratMedium',
                        color: Colors.black54),
                    children: [
                      TextSpan(
                        //text: widget.phoneNumber,
                        text: widget.phone,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'MontserratBold',
                            color: Colors.black),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: AppColors.appThemeColor,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: false,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: false,
                      animationType: AnimationType.fade,
                      /*validator: (v) {
                        if (v.length < 3) {
                          return "from validator";
                        } else {
                          return null;
                        }
                      },*/
                      pinTheme: PinTheme(
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        inactiveColor: AppColors.appThemeColor,
                        shape: PinCodeFieldShape.box,
                        borderWidth: 1.0,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor:
                            hasError ? Colors.orange : Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.white,
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: codeEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed#######");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Pas de de code reçu ? ",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontFamily: 'MontserratMedium',
                      ),
                      children: [
                        TextSpan(
                            text: " RENVOYEZ LE CODE",
                            style: TextStyle(
                                color: AppColors.appThemeColor,
                                fontFamily: 'MontserratBold',
                                fontSize: 16))
                      ]),
                ),
                onTap: () {
                  firebaseSendOTPuser(widget.phone, context);
                },
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, bottom: 20.0, left: 30.0, right: 30.0),
                child: Container(
                  width: 300,
                  height: 50.0,
                  child: smallRaisedBtn(
                    label: "Valider",
                    btnColor: AppColors.appThemeColor,
                    labelColor: Colors.white,
                    onPressAction: () {
                      firebaseVerifyOTPuser(widget.phone, widget.verificationId,
                          codeEditingController.text, context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ), */
    );
  }
  // CONNEXION DU USER ET REDIRECTION SUR PAGE D'INSCRIPTION

/*  Future<bool> firebaseVerifyOTPuser(String phone, String verificationId,
      String code_validation, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    setState(() {
      loadingMessage =
          "Vérification en cours, veuillez patienter s'il vous plaît ...";
    });
    AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: code_validation);
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    try {
      AuthResult result = await _auth.signInWithCredential(credential);

      FirebaseUser user = result.user;

      if (user != null) {
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

        Navigator.of(context).pushNamed('/signup-step1-screen',
            arguments: SignupStep1Screen(
              phone: phone,
            ));
      } else {
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
        //alertInfo(context, "Désolé une erreur s'est produite");
        Toaster.showErrorToast(
            message:
                "Désolé une erreur s'est produite, veuillez réessayé plus tard",
            gravity: ToastGravity.TOP);
      }
    } catch (error) {
      print("##error#######$error####");

      Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

      Toaster.showErrorToast(
          message:
              "Désolé une erreur s'est produite, veuillez réessayé plus tard",
          gravity: ToastGravity.TOP);
    }
  }

  // RENVOIS UN NOUVEAU CODE

  Future<bool> firebaseSendOTPuser(String phone, BuildContext context) async {
    //print("##phone#######$phone####");

    FirebaseAuth _auth = FirebaseAuth.instance;

    setState(() {
      loadingMessage =
          "Envoi du nouveau code, veuillez patienter s'il vous plaît ...";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

          if (user != null) {
            Navigator.of(context).pushNamed('/signup-step1-screen',
                arguments: SignupStep1Screen(
                  phone: phone,
                ));
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
          //alertInfo(context, "Désolé une erreur s'est produite");
          Toaster.showErrorToast(
              message:
                  "Désolé une erreur s'est produite, veuillez réessayé plus tard",
              gravity: ToastGravity.TOP);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
        },
        codeAutoRetrievalTimeout: null);
  } */
}
