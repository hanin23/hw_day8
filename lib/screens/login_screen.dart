import 'package:flutter/material.dart';
import 'package:hw_day8/extension/nav.dart';
import 'package:hw_day8/screens/data_screen.dart';
import 'package:hw_day8/screens/sign_up_screen.dart';
import 'package:hw_day8/service/api.dart';
import 'package:hw_day8/widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 157, 131, 201),
        title: Text(
          "Login page",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 100),
        child: Column(
          children: [
            TextFieldWidget(
              hint: "Enter you Email",
              icon: Icon(Icons.email),
              controller: emailController,
            ),
            SizedBox(height: 24),
            TextFieldWidget(
              hint: "Enter you Password",
              icon: Icon(Icons.password),
              controller: passwordController,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Api().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  if (context.mounted) {
                    context.push(DataScreen());
                  }
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Email or password is incorrect")));
                }

              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                context.pushAndClear(SignUpScreen());
              },
              child: Text("don't have an account? sign up"),
            ),
          ],
        ),
      ),
    );
  }
}