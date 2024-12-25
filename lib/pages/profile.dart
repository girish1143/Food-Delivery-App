import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Placeholder functions for actions
  void _showTermsAndConditions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Terms and Conditions"),
        content: const Text(
            "Here are the terms and conditions for using this app."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text(
            "Are you sure you want to delete your account? This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Account deleted")),
              );
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  void _logOut() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Log Out"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged out")),
              );
            },
            child: const Text("Log Out"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                  height: MediaQuery.of(context).size.height / 4.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width,
                        105.0,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6.5,
                    ),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(60),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "images/p1.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 70.0),
                    child: Text(
                      "Jaani",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),

            // Profile Info
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.person, color: Colors.black),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Jaani",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Email Info
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.email, color: Colors.black),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Jaani@465gmail.com",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Terms and Conditions
            ListTile(
              leading: const Icon(Icons.description, color: Colors.black),
              title: const Text(
                "Terms and Conditions",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              onTap: _showTermsAndConditions,
            ),
            const Divider(),

            // Delete Account
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text(
                "Delete Account",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              onTap: _deleteAccount,
            ),
            const Divider(),

            // Log Out
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text(
                "Log Out",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              onTap: _logOut,
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
