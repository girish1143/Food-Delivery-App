import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/pages/signup.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController mailcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = "";

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Password Reset Email has been sent!",
          style: TextStyle(fontSize: 18.0),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      String message = "An error occurred.";
      if (e.code == "user-not-found") {
        message = "No user found with that email.";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 18.0),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(height: 70.0),
          Container(
            alignment: Alignment.topCenter,
            child: const Text(
              "Password Recovery",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            "Enter your email",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 2.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: mailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize: 18.0, color: Colors.white54),
                          prefixIcon: Icon(Icons.person, color: Colors.white70, size: 30.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = mailcontroller.text.trim(); // Trim whitespace
                          });
                          resetPassword();
                        }
                      },
                      child: Container(
                        width: 140,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Send Email",
                            style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?", style: TextStyle(fontSize: 18.0, color: Colors.white)),
                        const SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                          },
                          child: const Text(
                            "Create",
                            style: TextStyle(color: Color.fromARGB(225, 184, 166, 6), fontSize: 20.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
