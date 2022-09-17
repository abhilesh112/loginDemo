import 'dart:convert';

import '../helper/shared_prefer.dart';
import '../model/api_response_model.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static final NetworkUtil _instance = NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  Future<ResponseModel> getCoinData() async {
    ResponseModel responseJson;
    try {
      final Uri uri =
          Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json");
      ////(uri);
      final http.Response response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'charset': 'utf-8',
      });

      if (response.statusCode == 200) {
        responseJson = ResponseModel.fromJson(jsonDecode(response.body));
        print(responseJson);
        SharedPrefs.saveDataFromApi(responseJson);
      } else {
        responseJson = ResponseModel();
      }
    } catch (e) {
      responseJson = ResponseModel();
    }
    return responseJson;
  }
}
