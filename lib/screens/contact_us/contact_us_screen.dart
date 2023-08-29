import 'package:biomaj/constants/app_colors.dart';
import 'package:biomaj/utils/small_raised_btn.dart';
import 'package:biomaj/widgets/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';




class ContactUsScreen extends StatefulWidget {

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  TextEditingController messageEditingContrller = TextEditingController();
  final _contactUsFormKeyNew = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: SimpleAppBarWidget(title: "Nous contacter", context: context, showLeading: true),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: EdgeInsets.only(left: 10, right: 10.0, bottom: 60.0),
                child: Text(
                  "Envoyez un message si vous rencontrez des difficultés ou vous si vous souhaitez avoir des informations.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontFamily: 'MontserratMedium'
                  ),
                  //overflow: TextOverflow.visible,
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Form(
                      key: _contactUsFormKeyNew,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0, bottom: 50.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      autofocus: false,
                                      controller: messageEditingContrller,
                                      textInputAction: TextInputAction.done,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                          labelText: "Message",
                                          prefixIcon: Icon(Icons.edit),
                                          //contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.0)
                                          ),
                                          isDense: false,
                                          contentPadding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 20.0),
                                          labelStyle: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15, fontFamily: 'MontserratRegular'
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15,
                                              fontFamily: 'MontserratRegular'
                                          ),
                                          helperStyle: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                              fontFamily: 'MontserratRegular'
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder:  OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide:  BorderSide(
                                                color: AppColors.appThemeColor,
                                                width: 1.0
                                            ),
                                          )
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                            child: Container(
                              width: 200.0,
                              height: 40.0,
                              child: SmallRaisedBtn(
                                //borderRadius: 30.0,
                                 width: double.infinity,
  onPressed: () {},
  borderRadius: BorderRadius.circular(20),
  child: Text('Envoyer'),
                                  ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
