import 'dart:convert';
import 'package:caproject_ecommerce_app/pages/shop_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  void validateFields() {
    setState(() {
      emailError = emailController.text.isEmpty ? 'Email is required' : null;
      passwordError = passwordController.text.isEmpty ? 'Password is required' : null;
    });
  }

  Future<void> remoteLogin() async {
    if (emailError != null || passwordError != null) {
      return; // Don't proceed if fields are invalid
    }

    http.Response response;
    response = await http.get(Uri.parse(
        "http://www.nattiee.com/ecom/login.php?email=${emailController.text.trim()}&password=${passwordController.text.trim()}"));
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int loginStatus = serverResponse['success'];
      if (loginStatus == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Username or password is invalid'),
            duration: Duration(seconds: 2),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
            ),
          ),
        );
      }
    } else {
      print("Server error ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/Images/nike-4-logo-png-transparent.webp',
                height: 200,
              ),
              const SizedBox(height: 15),
              Text(
                'Just Do It',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              MyTextField(
                initialObscureText: false,
                controller: emailController,
                labelText: 'Email',
                icon: Icons.mail,
                errorText: emailError,
              ),
              const SizedBox(height: 15),
              MyTextField(
                initialObscureText: true,
                controller: passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                sufIcon: Icons.visibility,
                sufIcon2: Icons.visibility_off,
                errorText: passwordError,
              ),
              const SizedBox(height: 15),
              MyButton(
                onTap: () {
                  validateFields();
                  remoteLogin();
                },
                text: 'log in',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?  ',
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}