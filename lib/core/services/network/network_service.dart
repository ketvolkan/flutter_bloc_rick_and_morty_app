import 'dart:io';

import 'package:dio/dio.dart';

enum Api { test, live }

extension ApiExtension on Api {
  String get path {
    switch (this) {
      case Api.test:
        return "https://rickandmortyapi.com/api";
      case Api.live:
        return "https://rickandmortyapi.com/api";
    }
  }
}

class NetworkService {
  Api _apiSelection = Api.test;

  Api get apiSelection => _apiSelection;

  set apiSelection(Api val) {
    _apiSelection = val;
    _networkManagerInstance = _createNetworkManagerInstance();
  }

  late Dio _networkManagerInstance;

  NetworkService() {
    _networkManagerInstance = _createNetworkManagerInstance();
  }

  Dio _createNetworkManagerInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl: _apiSelection.path,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Platform": Platform.isAndroid ? "android" : "ios",
        },
        receiveTimeout: const Duration(milliseconds: 15000),
        connectTimeout: const Duration(milliseconds: 15000),
      ),
    );

    return dio;
  }

  Dio get networkManager => _networkManagerInstance;

  void setToken(String token) {
    _networkManagerInstance.options.headers[HttpHeaders.authorizationHeader] = token;
  }

  void clearToken() {
    _networkManagerInstance.options.headers.remove(HttpHeaders.authorizationHeader);
  }
}
