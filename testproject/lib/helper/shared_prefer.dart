import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/api_response_model.dart';

class SharedPrefs {
  static FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  static void saveDataFromApi(ResponseModel model) async {
    dynamic userResponse = model.toJson();
    String jsonString = jsonEncode(userResponse);
    await storage.write(key: 'coinData', value: jsonString);
  }

  static Future<ResponseModel?> getSavedModel() async {
    String? jsonString = await storage.read(key: "coinData");
    if (jsonString == null) {
      return null;
    }
    var decodedJson = jsonDecode(jsonString);
    dynamic userResponse = ResponseModel.fromJson(decodedJson);
    return userResponse;
  }
}
