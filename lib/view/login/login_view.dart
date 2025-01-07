import 'package:flutter/material.dart';
import 'package:mvvm_architecture_new/res/components/rounded_button.dart';
import 'package:mvvm_architecture_new/utils/utils.dart';
import 'package:mvvm_architecture_new/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                prefixIcon: const Icon(Icons.lock),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              onFieldSubmitted: (value) {
                // Utils.fieldFocusChange(context, pa, nextFocus)
              },
            ),
            const SizedBox(height: 24),
            RoundButton(
                title: "Login",
                onPress: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;

                  // Example validation
                  if (email.isEmpty) {
                    Utils.flushBarErrorMessage("Email is empty", context);
                  } else if (password.isEmpty) {
                    Utils.flushBarErrorMessage("Password is empty", context);
                  } else if (password.length < 6) {
                    Utils.flushBarErrorMessage("Password is short", context);
                  } else {
                    Map data = {
                      "email": email,
                      "password": password,
                    };
                    authViewModel.loginApi(data, context);

                    Utils.toastSuccessMessage("Login success");
                  }

                  // Perform login action (e.g., API call)
                  print("Email: $email");
                  print("Password: $password");
                })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
