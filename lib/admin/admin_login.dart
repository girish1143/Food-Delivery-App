import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pro/admin/home_admin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<StatefulWidget> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                // Top Section
                _buildTopSection(constraints),
                // Form Section
                Expanded(child: _buildFormSection(constraints)),
              ],
            );
          },
        ),
      ),
    );
  }

  // Widget for the top gradient section
  Widget _buildTopSection(BoxConstraints constraints) {
    return Container(
      height: constraints.maxHeight / 3,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFff6e7f), Color(0xFFbfe9ff)], // Pink to blue gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(400, 120),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Admin Login",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Secure Access to Admin Dashboard",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the form section
  Widget _buildFormSection(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username Field
            const Text(
              "Username",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 8.0),
            _buildTextField(
              controller: usernameController,
              hintText: "Enter your username",
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            // Password Field
            const Text(
              "Password",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 8.0),
            _buildTextField(
              controller: passwordController,
              hintText: "Enter your password",
              icon: Icons.lock_outline,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 40.0),
            // Login Button
            Center(
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    loginAdmin();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 60.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFff758c), Color(0xFFff7eb3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable widget for text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    required String? Function(String?) validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black54),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black38),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Firestore login function
  void loginAdmin() {
    FirebaseFirestore.instance
        .collection("Admin")
        .where('id', isEqualTo: usernameController.text.trim())
        .where('password', isEqualTo: passwordController.text.trim())
        .get()
        .then((snapshot) {
      if (snapshot.docs.isEmpty) {
        _showSnackBar("Invalid Username or Password", Colors.redAccent);
      } else {
        _showSnackBar("Login Successful", Colors.green);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeAdmin()),
        );
      }
    }).catchError((error) {
      _showSnackBar("Error: ${error.toString()}", Colors.orangeAccent);
    });
  }

  // Helper function to show SnackBar
  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        message,
        style: const TextStyle(fontSize: 18.0),
      ),
    ));
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
