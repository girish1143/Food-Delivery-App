import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/pages/signup.dart';
import 'package:pro/pages/bottomnav.dart';
import 'package:pro/pages/forgotpassword.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "";
  final _formKey = GlobalKey<FormState>();

  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  Future<void> userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);

      // Navigate to BottomNav after successful login
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BottomNav()));
    } on FirebaseAuthException catch (e) {
      String errorMessage = (e.code == 'user-not-found')
          ? "No user found for this email."
          : (e.code == 'wrong-password')
          ? "Wrong password provided."
          : "An error occurred. Please try again.";

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Gradient Background
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF6A1B9A), // Purple
                    Color(0xFF42A5F5), // Blue
                  ],
                ),
              ),
            ),

            // White Form Container
            Positioned(
              top: MediaQuery.of(context).size.height / 2.5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: useremailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: userpasswordcontroller,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const ForgotPassword()),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = useremailcontroller.text;
                              password = userpasswordcontroller.text;
                            });
                            userLogin(); // Call login
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 40.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.deepPurple,
                        ),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()),
                            );
                          },
                          child: const Text(
                            "Don't have an account? Sign up",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Logo Section
            Positioned(
              top: MediaQuery.of(context).size.height / 8,
              left: MediaQuery.of(context).size.width / 4,
              child: Center(
                child: Image.asset(
                  "images/logo.jpg",
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
