// ignore_for_file: library_private_types_in_public_api, prefer_generic_function_type_aliases

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

/// Shared preferences layer through the app.
class SharedPrefs {
  static StreamingSharedPreferences? instance;


  SharedPrefs._();


  static Future<void> init() async {
    instance ??= await StreamingSharedPreferences.instance;


  }

  static final _SharedPrefsKeys keys =  _SharedPrefsKeys();

  static T getData<T>(SharedPrefsKeyGetter keyBuilder, {required T defaultValue}) {
    assert(T != dynamic);

    String key = keyBuilder(keys);

    switch (T) {
      case String:
        return instance!.getString(key, defaultValue: (defaultValue as String)).getValue() as T;
      case int:
        return instance!.getInt(key, defaultValue: (defaultValue as int)).getValue() as T;
      case bool:
        return instance!.getBool(key, defaultValue: (defaultValue as bool)).getValue() as T;
      case double:
        return instance!.getDouble(key, defaultValue: (defaultValue as double)).getValue() as T;
      case List:
        if (defaultValue is List<String>) {
          return instance!.getStringList(key, defaultValue: (defaultValue as List<String>)).getValue() as T;
        }
        throw 'Unsupported type [$T]';
      default:
        throw 'Unsupported type [$T]';
    }
  }

  static void setData<T>(SharedPrefsKeyGetter keyBuilder, T value) {
    assert(T != dynamic);

    String key = keyBuilder(keys);
    switch (T) {
      case String:
        instance!.setString(key, value as String);
        break;
      case int:
        instance!.setInt(key, value as int);
        break;
      case bool:
        instance!.setBool(key, value as bool);
        break;
      case double:
        instance!.setDouble(key, value as double);
        break;
      case List:
        instance!.setStringList(key, value as List<String>);
        break;
      default:
        throw 'Unsupported type [$T]';
    }
  }
}

class _SharedPrefsKeys {
  static const _baseKey = 'shared.prefs.';

  final String user = '$_baseKey' 'user';
  final String into = '$_baseKey' 'into';

}


typedef String SharedPrefsKeyGetter(_SharedPrefsKeys keys);
