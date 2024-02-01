import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learnflutter/Provider/login_provider.dart';
import 'package:provider/provider.dart';

class Login extends HookWidget {
  const Login({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<login_provider>(context);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: emailController,
              onChanged: (email) => loginProvider.validateEmail(email),
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              onChanged: (password) => loginProvider.validatePassword(password),
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                loginProvider.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
