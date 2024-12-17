import 'package:flutter/material.dart';
import 'package:mvvm_architecture_new/utils/routes/routes_name.dart';
// import 'package:mvvm_architecture_new/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.home);
          // Utils.toastMessage('No Internet Connection!');
          // Utils.flushBarErrorMessage('message', context);
          // var snackbar = Utils.snackbar('message', context);
        },
        child: const Text("CLICK"),
      ),
    ));
  }
}
