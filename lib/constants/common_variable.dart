import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CommonVariable {

  static const apiBaseUrl = "https://biomaj.net/api/"; //prod
  static const baseUrl = "https://biomaj.net/"; //prod
  static const imageBaseUrl = "https://biomaj.net/public/"; 

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get globalContext => navigatorKey.currentState!.overlay!.context;

  static String? userTken;
  static String? setglobalOneSignalPlayerId;

  static final ddMMYYFormat = DateFormat('dd-MM-yyyy');
  static final formattedDate = DateFormat('kk:mm:ss EEE d MMM');
  static final hhMMFormat = DateFormat('h:m');
  
}
