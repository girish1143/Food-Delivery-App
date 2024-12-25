import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/pages/login.dart';
import 'package:pro/pages/bottomnav.dart';
import 'package:pro/widget/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "";
  String password = "";
  String name = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> registration() async {
    if (password.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Registered Successfully",
            style: TextStyle(fontSize: 16.0),
          ),
        ));

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BottomNav()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
              content: Text(
              "Password provided is too weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exsists",
                style: TextStyle(fontSize: 18.0),
              )));
        } else {
          _showSnackBar("Registration failed. Try again.");
        }
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orangeAccent,
      content: Text(
        message,
        style: const TextStyle(fontSize: 16.0),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4169E1), Color(0xFFE5E5E5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              // Header Section
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "images/logo.jpg",
                        width: MediaQuery.of(context).size.width / 3,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Create Your Account",
                        style: AppWidget.headlineTextFeildStyle().copyWith(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Form Section
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            prefixIcon: const Icon(Icons.person_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: mailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                email = mailController.text;
                                name = nameController.text;
                                password = passwordController.text;
                              });
                              await registration();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: const Color(0xFF4169E1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const LogIn()));
                          },
                          child: Center(
                            child: Text(
                              "Already have an account? Login",
                              style: AppWidget.semiBoldTextFeildStyle().copyWith(
                                color: const Color(0xFF4169E1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
