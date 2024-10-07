import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();


  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset('assets/bssllogo-preview.png',scale: 1,height: 130,),
                Text(
                  "dController ERP SELF SERVICE",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(height: 20),
                Text(
                  "Login",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(height: 20),
                // Email Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      final emailPattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      if (!RegExp(emailPattern).hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                ),
                SizedBox(height: 20),
                // Password Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(Icons.visibility_off, color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  validator: validateNotEmpty,
                  obscureText: true,
                ),
                SizedBox(height: 10),
                // Remember me and Forgot password row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        Text("Remember me", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses primary color
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Log In Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary, // Uses primary color for button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text("Log In", style: TextStyle(color: Theme.of(context).colorScheme.secondary)), // Uses secondary (white)
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses primary color
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary, // Uses primary color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
