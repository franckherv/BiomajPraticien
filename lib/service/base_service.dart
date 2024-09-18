import 'dart:convert';

import 'package:biomaj/constants/common_variable.dart';
import 'package:get/get.dart';


class BaseService extends GetConnect {


//  get All with token
  Future<Response> getAllWithToken(
      {required String url, Map<String, dynamic>? query}) async {
    if (CommonVariable.userTken != null) {
      return get(CommonVariable.apiBaseUrl + url, headers: getheader(), query: query);
    } else {

      return const Response(body: "token not found", statusCode: 401);
    }
  }

//  post All with token
  Future<Response> postAllWithToken({
    required String url,
    required Map<String, dynamic> body,
   // Map<String, dynamic>? query,
  }) async {
    if (CommonVariable.userTken != null) {
      return post(
        CommonVariable.apiBaseUrl + url,
        jsonEncode(body),
        headers: getheader(),
       // query: query,
      );
    } else {
      return const Response(body: "token not found", statusCode: 401);
    }
  }

  /// Get an post all without token
  Future<Response> getAllWithoutToken(
      {required String url, Map<String, dynamic>? query}) async {
    return get(CommonVariable.apiBaseUrl + url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        query: query);
  }

  /// Get an post all without token
  Future<Response> postAllWithoutToken({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
  }) async {
    return post(
      CommonVariable.apiBaseUrl + url,
      body,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      query: query,
    );
  }

  // Headers for the requette
  Map<String, String> getheader() => {
        "Accept": "application/json",
        "Authorization": 'Bearer ${CommonVariable.userTken}'
      };
}
