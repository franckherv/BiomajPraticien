import 'dart:convert';
import 'package:biomaj/models/preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class Token {
  static final String _prefsKey = SharedPrefs.keys.user;

  String? accessToken;
  //String refreshToken;
  String tokenType;
  //int expiresIn;

  Token({
    this.accessToken,
    //this.refreshToken,
    this.tokenType = 'Bearer',
    //this.expiresIn
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    print("jsooooooooo  $json =========");
    return Token(
      accessToken: json['access_token'],
      //refreshToken: json['refresh_token'],
      tokenType: json['token_type'] ?? 'Bearer',
      //expiresIn: json['expires_in']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      //'refresh_token': refreshToken,
      'token_type': tokenType,
      //'expired_in': expiresIn
    };
  }

  String get authorizationHeader => '$tokenType $accessToken';

  @override
  String toString() => toJson().toString();

  factory Token.fromPrefs() {
    Preference<String> encodedUser =
        SharedPrefs.instance!.getString(_prefsKey, defaultValue: '');

    String val = encodedUser.getValue();
    // if (val == '') return false;
    return Token.fromJson(jsonDecode(val));
  }

  /// Save the instance of user in shared preferences and same user instance
  Future store({Token? token}) async {
    // if (preserveToken) {
    //   this.token ??= UserModels.fromPrefs()!.token;
    // }

    await SharedPrefs.instance!.setString(_prefsKey, jsonEncode(token));
//    final preferences = await StreamingSharedPreferences.instance;
//    await preferences.setString(_prefsKey, jsonEncode(toJson()));
    // Update the provider;
    return this;
  }
}
/*class Token {
  String accessToken;
  //String refreshToken;
  String tokenType;
  //int expiresIn;

  Token({
    this.accessToken,
    //this.refreshToken,
    this.tokenType = 'Bearer',
    //this.expiresIn
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['access_token'],
      //refreshToken: json['refresh_token'],
      tokenType: json['token_type'] ?? 'Bearer',
      //expiresIn: json['expires_in']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      //'refresh_token': refreshToken,
      'token_type': tokenType,
      //'expired_in': expiresIn
    };
  }

  String get authorizationHeader => '$tokenType $accessToken';

  @override
  String toString() => toJson().toString();
}*/
