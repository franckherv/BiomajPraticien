import 'package:biomaj/models/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CommonVariable {
  //static final apiBaseUrl = "http://192.168.1.10:240/api/"; //dev
  //static final baseUrl = "http://192.168.1.10:240/"; //dev

  static const apiBaseUrl = "https://biomaj.net/api/"; //prod
  static const baseUrl = "https://biomaj.net/"; //prod

  //static final sckApiBaseUrl = "https://dev.sycapay.net/api/"; //test
  static const imageBaseUrl = "https://biomaj.net/public/"; 

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static BuildContext get globalContext =>
      navigatorKey.currentState!.overlay!.context;

  static String? userTken;
  static String? setglobalOneSignalPlayerId;
  static UserModels? localUserDatas;

  static final ddMMYYFormat = DateFormat('dd-MM-yyyy');
  static final formattedDate = DateFormat('kk:mm:ss EEE d MMM');
  static final hhMMFormat = DateFormat('h:m');
}
