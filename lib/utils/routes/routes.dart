import 'package:flutter/material.dart';
import 'package:mvvm_architecture_new/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_new/view/home_screen.dart';
import 'package:mvvm_architecture_new/view/login/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route define'),
            ),
          );
        });
    }
  }
}
