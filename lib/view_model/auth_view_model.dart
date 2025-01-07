import 'package:flutter/material.dart';
import 'package:mvvm_architecture_new/repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      print("Error: $data");
    }).onError((error, stackTrace) {
      print("Error: $error");
    });
  }
}
