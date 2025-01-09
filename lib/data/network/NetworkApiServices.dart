import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm_architecture_new/data/app_exceptions.dart';
import 'package:mvvm_architecture_new/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
// GET API
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = responseJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

// POST API
  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {"Content-Type": "application/json"},
      ).timeout(const Duration(seconds: 20));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with status code: ${response.statusCode}');
    }
  }

// PATCH/PUT API
  @override
  Future getPutApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await patch(Uri.parse(url)).timeout(Duration(seconds: 20));
      // Response response =
      //     await put(Uri.parse(url)).timeout(Duration(seconds: 20));
      responseJson = responseJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

// DELETE API
  @override
  Future getDeleteApiResponse(String url, String id) async {
    dynamic responseJson;
    try {
      Response response =
          await delete(Uri.parse(url)).timeout(Duration(seconds: 20));
      responseJson = responseJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

// RESPONSE STATUS CODE
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
