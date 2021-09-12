import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Api extends ChangeNotifier {
  String url1 = "https://my.iq.group/api/selfcare/v2/autologin";
  String url2 = "https://my.iq.group/api/selfcare/v2/cpe";
  Map<String, dynamic> headers = {'X-Channel': "web", "Accept-Language": "en"};

  void getInformation() async {
    var _dio = new Dio();
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    var response = await _dio.get(
      url1,
      options: Options(
        headers: this.headers,
      ),
    );

    String token = response.data['data']['token'].toString();
    headers['Authorization'] = "Bearer $token";

    var response2 = await _dio.get(
      url2,
      options: Options(
        headers: this.headers,
      ),
    );

    print(response2.data);
    notifyListeners();
  }
}
