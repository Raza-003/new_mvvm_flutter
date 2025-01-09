import 'package:mvvm_architecture_new/data/network/BaseApiServices.dart';
import 'package:mvvm_architecture_new/data/network/NetworkApiServices.dart';
import 'package:mvvm_architecture_new/res/app_urls.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  // Future<dynamic> loginApi(dynamic data) async {
  //   try {
  //     dynamic response =
  //         await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
  //     return response;
  //   } catch (e) {
  //     throw (e);
  //   }
  // }

  Future<dynamic> loginApi(dynamic data) async {
    return await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw (e);
    }
  }
}
