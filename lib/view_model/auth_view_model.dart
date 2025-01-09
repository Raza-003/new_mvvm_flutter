import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_new/repository/auth_repository.dart';
import 'package:mvvm_architecture_new/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    try {
      final response = await _myRepo.loginApi(data);
      if (kDebugMode) {
        print("Response: $response");
      }
      // Handle successful response here
    } catch (error) {
      if (kDebugMode) {
        print("Error: $error");
      }
      Utils.flushBarErrorMessage("Login failed: $error", context);
    }
  }
}
