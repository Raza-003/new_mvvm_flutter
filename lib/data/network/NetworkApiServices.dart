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
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url)).timeout(Duration(seconds: 20));
      responseJson = responseJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
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
