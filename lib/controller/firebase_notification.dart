// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../service/base_service.dart';

class FirebaseNotification extends GetxController {
  BaseService baseService = BaseService();
  GetStorage box = GetStorage();
  RxString fcmToken = "".obs;


  // get token methode
  Future<void> getTokenToStore() async {
    await FirebaseMessaging.instance.getToken().then((token) async {
        fcmToken.value = token.toString();
      log("token ======> ${fcmToken.value}");
    });
  }


  //Listen Firebase token update
  Future<void> firebaseTokenUpdate() async {
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmtoken) async {
           fcmToken.value = fcmtoken.toString();

      // log(" logoo ${respons.body.toString()}");
    }).onError((err) {
      log(err.toString());
    });
  }

//On receive message
 Future<void> receiveMessageFirebase() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      if (remoteMessage.notification == null) return;
      final event = remoteMessage.data['event'];
     log("event ${event}");
       log(remoteMessage.notification!.body.toString());
     switch (event.toString().toUpperCase()) {
      
      

    
      }
   
   
    });
  }

  //Listen when new message is received
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.notification == null) return;
    final event = message.data['event'];
    switch (event.toString().toUpperCase()) {
      case 'PROFIL':
        log("profilll");
        break;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    receiveMessageFirebase();
    setupInteractedMessage();
    firebaseTokenUpdate();
  }
}
