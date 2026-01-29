import 'package:flutter/material.dart';
import 'package:hw_day8/extension/nav.dart';
import 'package:hw_day8/screens/login_screen.dart';
import 'package:hw_day8/service/api.dart';
import 'package:hw_day8/widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 191, 133, 185),
        title: Text(
          "signUp page",
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
              onPressed: () {
                Api().signUp(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              child: Text("Sign up"),
            ),
            TextButton(
              onPressed: () {
                context.pushAndClear(LoginScreen());
              },
              child: Text("already have an account? login"),
            ),
          ],
        ),
      ),
    );
  }
}